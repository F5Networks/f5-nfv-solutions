#!/bin/bash

#vars
ssh_key_name="${1}"
verifyCloudlibsOs="${2}"

#cloudify manager
manager_mgmt_host="${3}"
bp_name="${4}"
tenant_name="${5}"
cloud_libs_path="${6}"
cloud_libs_name="${7}"
ts_path="${8}"
ts_name="${9}"
as3_path="${10}"
as3_name="${11}"
manager_rest_username="${12}"
manager_rest_password="${13}"
useConfigDrive="${14}"
msg=""


function download_files_from_cloudify_manager(){
    max_retries=10
    echo "**preOnboard: Download cloud-libs hash**" >> /var/log/cloud/f5-vnf/cloud_config.log
    hash_curl='curl -u '"$manager_rest_username"':'"$manager_rest_password"' --cacert /config/internal_ca_cert.pem https://'"$manager_mgmt_host"':53333/resources/blueprints/'"$tenant_name"'/'"$bp_name""$cloud_libs_path"'verifyHash -o /config/verifyHash'
    checks=0
    while [ $checks -lt "$max_retries" ]; do echo downloading verifyHash
      eval "$hash_curl"
      if [ -f /config/verifyHash ]; then
          echo "preOnboard: cloud-libs hash downloaded" >> /var/log/cloud/f5-vnf/cloud_config.log
          break
      else
          let checks=checks+1
          echo preOnboard: Couldnt download cloud-libs hash, retrying... retry["${checks}"/10] >> /var/log/cloud/f5-vnf/cloud_config.log
          sleep 10
      fi
    done
    if [ "$checks" -eq "$max_retries" ];then
        msg="$msg"'\n'preOnboard: Error: verifyHash couldnt be downloaded!
        echo "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi

    echo "**preOnboard: Download cloud-libs**" >> /var/log/cloud/f5-vnf/cloud_config.log
    libs_curl='curl -u '"$manager_rest_username"':'"$manager_rest_password"' --cacert /config/internal_ca_cert.pem https://'"$manager_mgmt_host"':53333/resources/blueprints/'"$tenant_name"'/'"$bp_name""$cloud_libs_path""$cloud_libs_name"' -o /config/cloud/f5-vnf/'"$cloud_libs_name"
    echo "$libs_curl" >> /var/log/cloud/f5-vnf/cloud_config.log
    checks=0
    while [ $checks -lt 10 ]; do echo preOnboard: downloading "$cloud_libs_name"
      eval "$libs_curl"
      if [ -f /config/cloud/f5-vnf/"$cloud_libs_name" ]; then
          echo "preOnboard: cloud-libs downloaded" >> /var/log/cloud/f5-vnf/cloud_config.log
          break
      else
          let checks=checks+1
          echo preOnboard: Couldnt download cloud-libs, , retrying... retry["${checks}"/10] >> /var/log/cloud/f5-vnf/cloud_config.log
          sleep 10
      fi
    done
    if [ "$checks" -eq "$max_retries" ];then
        msg="$msg"'\n'"preOnboard: Error: cloud-libs couldn't be downloaded!"
        echo "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi

    echo "**preOnboard: Download AS3:**" >> /var/log/cloud/f5-vnf/cloud_config.log
    as3_curl='curl -u '"$manager_rest_username"':'"$manager_rest_password"' --cacert /config/internal_ca_cert.pem https://'"$manager_mgmt_host"':53333/resources/blueprints/'"$tenant_name"'/'"$bp_name""$as3_path""$as3_name"' -o /tmp/'"$as3_name"
    echo "$as3_curl" >> /var/log/cloud/f5-vnf/cloud_config.log
    checks=0
    while [ $checks -lt 10 ]; do echo downloading "$as3_name"
      eval "$as3_curl"
      if [ -f /tmp/"$as3_name" ]; then
          echo "preOnboard: AS3 downloaded" >> /var/log/cloud/f5-vnf/cloud_config.log
          break
      else
          let checks=checks+1
          echo preOnboard: Couldnt download AS3, retrying... retry["${checks}"/10] >> /var/log/cloud/f5-vnf/cloud_config.log
          sleep 10
      fi
    done
    if [ "$checks" -eq "$max_retries" ];then
        msg="$msg"'\n'"preOnboard: Error: AS3 couldn't be downloaded!"
        echo "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi

    echo "**preOnboard: Download telemetry-streaming:**" >> /var/log/cloud/f5-vnf/cloud_config.log
    ts_curl='curl -u '"$manager_rest_username"':'"$manager_rest_password"' --cacert /config/internal_ca_cert.pem https://'"$manager_mgmt_host"':53333/resources/blueprints/'"$tenant_name"'/'"$bp_name""$ts_path""$ts_name"' -o /tmp/'"$ts_name"
    echo "$ts_curl" >> /var/log/cloud/f5-vnf/cloud_config.log
    checks=0
    while [ $checks -lt 10 ]; do echo downloading "$ts_name"
      eval "$ts_curl"
      if [ -f /tmp/"$ts_name" ]; then
          echo "preOnboard: TS downloaded" >> /var/log/cloud/f5-vnf/cloud_config.log
          break
      else
          let checks=checks+1
          echo preOnboard: Couldnt download TS, retrying... retry["${checks}"/10] >> /var/log/cloud/f5-vnf/cloud_config.log
          sleep 10
      fi
    done
    if [ "$checks" -eq "$max_retries" ];then
        msg="$msg"'\n'"preOnboard: Error: telemetry-streaming couldn't be downloaded!"
        echo "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi
}

function prep_cloud_libs() {
    if [[ "$msg" == "" ]]; then
        echo 'preOnboard: Preparing CloudLibs' >> /var/log/cloud/f5-vnf/cloud_config.log
        mkdir -p /config/cloud/f5-vnf/node_modules/@f5devcentral
        tar xvfz /config/cloud/f5-vnf/f5-cloud-libs.tar.gz -C /config/cloud/f5-vnf/node_modules/@f5devcentral
        if [ "$verifyCloudlibsOs" == "True" ] ; then
            tar --warning=no-unknown-keyword -zxf /config/cloud/f5-vnf/f5-cloud-libs-openstack.tar.gz -C /config/cloud/f5-vnf/node_modules/@f5devcentral > /dev/null
        fi
        touch /config/cloud/f5-vnf/cloudLibsReady
    fi
}

function check_mcpd_status() {
    echo 'preOnboard: Starting MCP status check' >> /var/log/cloud/f5-vnf/cloud_config.log
    checks=0
    while [ $checks -lt 120 ]; do echo preOnboard: checking mcpd
        if tmsh -a show sys mcp-state field-fmt | grep -q running; then
            echo preOnboard: mcpd ready >> /var/log/cloud/f5-vnf/cloud_config.log
            break
        fi
        echo preOnboard: mcpd not ready yet
        let checks=checks+1
        sleep 10
    done
}

function configure_ssh_key() {
    echo 'preOnboard: Configuring access to cloud-init data' >> /var/log/cloud/f5-vnf/cloud_config.log
    configDriveSrc=$(blkid -t LABEL="config-2" -odevice)
    configDriveDest="/mnt/config"

    if [[ "$useConfigDrive" == "True" ]]; then
        echo 'preOnboard: Configuring Cloud-init ConfigDrive'
        mkdir -p $configDriveDest
        if mount "$configDriveSrc" $configDriveDest; then
            echo 'preOnboard: Adding SSH Key from Config Drive' >> /var/log/cloud/f5-vnf/cloud_config.log
            if sshKey=$(python -c "import sys, json; print json.load(sys.stdin)[\"public_keys\"][\"${ssh_key_name}\"]" < "$configDriveDest"/openstack/latest/meta_data.json) ; then
                echo "$sshKey" >> /root/.ssh/authorized_keys
            else
                msg="$msg"'\n'"Pre-onboard failed: Unable to inject SSH key from config drive."
                echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
            fi
        else
            msg="$msg"'\n'"Pre-onboard failed: Unable to mount config drive."
            echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
        fi

    else
        echo 'preOnboard: Adding SSH Key from Metadata service' >> /var/log/cloud/f5-vnf/cloud_config.log
        declare -r tempKey="/config/cloud/f5-vnf/os-ssh-key.pub"
        if curl http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key -s -f --retry 5 --retry-max-time 300 --retry-delay 10 -o $tempKey ; then
            (head -n1 $tempKey) >> /root/.ssh/authorized_keys
            rm $tempKey
        else
            msg="$msg"'\n'"Pre-onboard failed: Unable to inject SSH key from metadata service."
            echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
        fi
    fi
}

function verify_files() {
    echo 'preOnboard: Loading verifyHash script' >> /var/log/cloud/f5-vnf/cloud_config.log
    if ! tmsh load sys config merge file /config/verifyHash; then
        echo preOnboard: Cannot validate signature of /config/verifyHash
        msg="$msg"'\n'"preOnboard: Unable to validate verifyHash."
        echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi
    echo 'loaded verifyHash'

    declare -a filesToVerify=("/config/cloud/f5-vnf/f5-cloud-libs.tar.gz")
    if [ "$verifyCloudlibsOs" == "True" ] ; then
        filesToVerify+=("/config/cloud/f5-vnf/f5-cloud-libs-openstack.tar.gz")
    fi
    for fileToVerify in "${filesToVerify[@]}"
    do
        echo preOnboard: Verifying "$fileToVerify" >> /var/log/cloud/f5-vnf/cloud_config.log
        if ! tmsh run cli script verifyHash "$fileToVerify"; then
            echo preOnboard: "$fileToVerify" is not valid
            msg="$msg"'\n'"preOnboard: Unable to verify one or more files."
            echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
        fi
        echo preOnboard: Verified "$fileToVerify" >> /var/log/cloud/f5-vnf/cloud_config.log
    done
}

function print_msg() {
    if [[ "$msg" == "" ]]; then
        msg="$msg"'\n'"Pre-onboard completed without error."
    else
        msg="$msg"'\n'"Last Error:$msg . See /var/log/cloud/f5-vnf/cloud_config.log for details."
    fi

    echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log

}

function main() {
    echo '******STARTING PRE-ONBOARD******' >> /var/log/cloud/f5-vnf/cloud_config.log
    check_mcpd_status
    download_files_from_cloudify_manager
    verify_files
    prep_cloud_libs
    configure_ssh_key
    print_msg
    echo '******PRE-ONBOARD DONE******' >> /var/log/cloud/f5-vnf/cloud_config.log
}

main
