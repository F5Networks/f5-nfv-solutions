#!/bin/bash

host='127.0.0.1'
dfl_mgmt_port='443'
user='admin'
passwd="${1}"
FN="${2}"
max_retries=10

function check_services(){
  echo "******Starting to verify services state before AS3 installation ******" >> /var/log/cloud/f5-vnf/cloud_config.log

  # verify BIG-IP onboarding using iControl REST
  # remote BIG-IP address
  host='localhost'

  checks=0
  state=''
  while [ $checks -lt "$max_retries" ]; do
    echo 'installAS3: Verify MCP ready'
    response=$(curl -ku $user:$passwd --connect-timeout 10 https://$host:$dfl_mgmt_port/mgmt/tm/sys/mcp-state)
    if [[ $response =~ .*"running".* ]]; then
      echo "installAS3: MCP service is UP and running." >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installAS3: MCP service is not responsive, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 15
    fi
  done

  checks=0
  while [ $checks -lt "$max_retries" ]; do
    echo 'installAS3: Verify license'
    response=$(curl -ku $user:$passwd --connect-timeout 10 https://$host:$dfl_mgmt_port/mgmt/tm/sys/license)
    if [[ $response =~ .*"registrationKey".* ]]; then
      echo "installAS3: License is assigned." >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installAS3: License is not yet assigned, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 15
    fi
  done

  check_sys_version
  echo "******Finished to verify services state before AS3 installation ******"

}


function check_sys_version(){
  checks=0
  while [ $checks -lt "$max_retries" ]; do
    echo 'installAS3: Verify REST'
    response=$(curl -ku $user:$passwd --connect-timeout 10 https://$host:$dfl_mgmt_port/mgmt/tm/sys/version)
    echo $response
    if [[ $response =~ .*"\"description\":\"BIG-IP\"".* ]]; then
      echo "installAS3: REST is ready" >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installAS3: REST is not running properly yet, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 15
    fi
  done
}


function install_AS3(){
  # set request data
  # packageFilePath can point anywhere local (e.g., the config_drive)
  DATA='{"operation":"INSTALL","packageFilePath":"'"/tmp/$FN"'"}'

  echo "installAS3: Installing AS3:" >> /var/log/cloud/f5-vnf/cloud_config.log
  touch /var/config/rest/iapps/enable
  # POST to BIG-IP
  response=$(curl -skvu $user:$passwd -sb -X POST 'https://'$host':'$dfl_mgmt_port'/mgmt/shared/iapp/package-management-tasks' -H "Origin: https://$host:$dfl_mgmt_port" -H 'Content-Type: application/json;charset=UTF-8' --data $DATA)

  echo "*********************Install response***********************"
  echo $response
  echo $response > as3_install_response.json
  self_link=$(jq -r '.selfLink' as3_install_response.json)
  echo "*********************selfLink:***********************"
  echo $self_link

  checks=0
  max_retries=10
  while [ $checks -lt "$max_retries" ]; do
    echo 'installAS3: Verify REST'
    response=$(curl -ku $user:$passwd $self_link)
    echo $response

    if [[ $response =~ .*"\"status\":\"FINISHED\"".* ]]; then
      echo "installAS3: AS3 installation has FINISHED status" >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    elif [[ $response =~ .*"\"errorMessage\":\"Package f5-appsvcs version".*"is already installed.\"".* ]]; then
      echo "installAS3: AS3 is already installed" >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installAS3: AS3 installation has not finished yet, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 5
    fi
  done

}

function check_AS3_readiness(){
  echo "installAS3: Checking AS3 service state." >> /var/log/cloud/f5-vnf/cloud_config.log
  checks=0
  state=""
  restjavad_restarted=true
  restnoded_restarted=true

  check_sys_version

  while [ $checks -lt "$max_retries" ]; do
    response=$(curl -kvu $user:$passwd 'https://127.0.0.1/mgmt/shared/appsvcs/info')
    if [[ $response =~ .*"version\":\"3.19.1".* ]]; then
      state="AS3 service is UP and running."
      break
    else
      let checks=checks+1
      echo installAS3: AS3 service is not responsive, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      if [ "$restjavad_restarted" == false ]; then
        echo installAS3: Restarting restjavad service >> /var/log/cloud/f5-vnf/cloud_config.log
        curl -skvvu $user:$passwd -X POST 'https://127.0.0.1/mgmt/tm/sys/service' -H "Content-Type: application/json" -H "Origin: https://127.0.0.1" -d '{"command":"restart","name":"restjavad"}'
        restjavad_restarted=true
      elif [ "$restnoded_restarted" == false ]; then
        echo installAS3: Restarting restnoded service >> /var/log/cloud/f5-vnf/cloud_config.log
        curl -skvvu $user:$passwd -X POST 'https://127.0.0.1/mgmt/tm/sys/service' -H "Content-Type: application/json" -H "Origin: https://127.0.0.1" -d '{"command":"restart","name":"restnoded"}'
        restnoded_restarted=true
      fi
      let max=max_retries-3
      if [ $checks -gt $max ]; then
        echo installAS3: Lets restart one more time
        restjavad_restarted=false
        restnoded_restarted=false
      fi
      sleep 10
    fi
    state="installAS3: AS3 service is not responsive despite restarts." >> /var/log/cloud/f5-vnf/cloud_config.log
  done
  echo $state

}

function check_listening_ports(){
  checks=0
  max_retries=10
  while [ $checks -lt "$max_retries" ]; do
    response=$(netstat -anp)
    if [[ $response =~ .*"tcp".*"8100".*"LISTEN".* ]]; then
      echo "installAS3: TCP is listening on port 8100." >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installAS3: TCP is not listening on port 8100, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
    fi
  done
}

function main() {
  check_services
  check_listening_ports
  install_AS3
  check_AS3_readiness
}

main
