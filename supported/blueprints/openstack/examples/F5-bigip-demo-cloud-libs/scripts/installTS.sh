#!/bin/bash

host='127.0.0.1'
dfl_mgmt_port='443'
user='admin'
passwd="${1}"
FN="${2}"
max_retries=10

function check_services(){
  echo "******Starting to verify services state before TS installation ******" >> /var/log/cloud/f5-vnf/cloud_config.log

  host='localhost'

  checks=0
  state=''
  while [ $checks -lt "$max_retries" ]; do
    echo 'installTS: Verify MCP ready'
    response=$(curl -ku $user:$passwd --connect-timeout 10 https://$host:$dfl_mgmt_port/mgmt/tm/sys/mcp-state)
    if [[ $response =~ .*"running".* ]]; then
      echo "installTS: MCP service is UP and running." >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installTS: MCP service is not responsive, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 15
    fi
  done

  check_sys_version
  echo "******Finished to verify services state before TS installation ******"

}


function check_sys_version(){
  checks=0
  while [ $checks -lt "$max_retries" ]; do
    echo 'installTS: Verify REST'
    response=$(curl -ku $user:$passwd --connect-timeout 10 https://$host:$dfl_mgmt_port/mgmt/tm/sys/version)
    echo $response
    if [[ $response =~ .*"\"description\":\"BIG-IP\"".* ]]; then
      echo "installTS: REST is ready" >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installTS: REST is not running properly yet, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 15
    fi
  done
}


function install_TS(){
  DATA='{"operation":"INSTALL","packageFilePath":"'"/tmp/$FN"'"}'

  echo "installTS: Installing telemetry-streaming:" >> /var/log/cloud/f5-vnf/cloud_config.log
  
  response=$(curl -skvu $user:$passwd -sb -X POST 'https://'$host':'$dfl_mgmt_port'/mgmt/shared/iapp/package-management-tasks' -H "Origin: https://$host:$dfl_mgmt_port" -H 'Content-Type: application/json;charset=UTF-8' --data $DATA)

  echo "*********************Install response***********************"
  echo $response
  echo $response > telemetry_install_response.json
  self_link=$(jq -r '.selfLink' telemetry_install_response.json)
  echo "*********************selfLink:***********************"
  echo $self_link

  checks=0
  max_retries=10
  while [ $checks -lt "$max_retries" ]; do
    echo 'installTS: Verify REST'
    response=$(curl -ku $user:$passwd $self_link)
    echo $response

    if [[ $response =~ .*"\"status\":\"FINISHED\"".* ]]; then
      echo "installTS: TS installation has FINISHED status" >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    elif [[ $response =~ .*"\"errorMessage\":\"Package f5-telemetry version".*"is already installed.\"".* ]]; then
      echo "installTS: TS is already installed" >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installTS: TS installation has not finished yet, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      sleep 5
    fi
  done

}

# curl -ku admin:default https://localhost/mgmt/shared/telemetry/info

function check_TS_readiness(){
  echo "installTS: Checking TS service state." >> /var/log/cloud/f5-vnf/cloud_config.log
  checks=0
  state=""
  restjavad_restarted=true
  restnoded_restarted=true

  check_sys_version

  while [ $checks -lt "$max_retries" ]; do
    response=$(curl -kvu $user:$passwd 'https://127.0.0.1/mgmt/shared/telemetry/info')
    if [[ $response =~ .*"version\":\"1.11.0".* ]]; then
      state="TS service is UP and running."
      break
    else
      let checks=checks+1
      echo installTS: TS service is not responsive, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
      if [ "$restjavad_restarted" == false ]; then
        echo installTS: Restarting restjavad service >> /var/log/cloud/f5-vnf/cloud_config.log
        curl -skvvu $user:$passwd -X POST 'https://127.0.0.1/mgmt/tm/sys/service' -H "Content-Type: application/json" -H "Origin: https://127.0.0.1" -d '{"command":"restart","name":"restjavad"}'
        restjavad_restarted=true
      elif [ "$restnoded_restarted" == false ]; then
        echo installTS: Restarting restnoded service >> /var/log/cloud/f5-vnf/cloud_config.log
        curl -skvvu $user:$passwd -X POST 'https://127.0.0.1/mgmt/tm/sys/service' -H "Content-Type: application/json" -H "Origin: https://127.0.0.1" -d '{"command":"restart","name":"restnoded"}'
        restnoded_restarted=true
      fi
      let max=max_retries-3
      if [ $checks -gt $max ]; then
        echo installTS: Lets restart one more time
        restjavad_restarted=false
        restnoded_restarted=false
      fi
      sleep 10
    fi
    state="installTS: TS service is not responsive despite restarts." >> /var/log/cloud/f5-vnf/cloud_config.log
  done
  echo $state

}

function check_listening_ports(){
  checks=0
  max_retries=10
  while [ $checks -lt "$max_retries" ]; do
    response=$(netstat -anp)
    if [[ $response =~ .*"tcp".*"8100".*"LISTEN".* ]]; then
      echo "installTS: TCP is listening on port 8100." >> /var/log/cloud/f5-vnf/cloud_config.log
      break
    else
      let checks=checks+1
      echo installTS: TCP is not listening on port 8100, retrying... retry["${checks}"/"${max_retries}"] >> /var/log/cloud/f5-vnf/cloud_config.log
    fi
  done
}

function main() {
  check_services
  check_listening_ports
  install_TS
  check_TS_readiness
}

main
