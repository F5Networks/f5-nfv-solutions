#!/bin/bash
echo '*****ONBOARD STARTING******' >> /var/log/cloud/f5-vnf/cloud_config.log

#vars
#some default values set by heat str_replace

#licensing
licenseOpt=""
license=""
addOnLicenses=""
licenseType="BIGIQ"

bigIpVersion=""

mgmt_mtu="${1}"

bigIqHost="${2}"
bigIqUsername="${3}"
bigIqLicPool="${4}"
bigIqPwdUri="${5}"

bigIqMgmtIp="${2}"
bigIqMgmtPort=""
mgmtPortId="${6}"
tier="${7}"
hostName="${8}"
ric_licensing="${9}"

# these variables considered only when $tier=custom_tier and $ric_licensing=custom_ric_licensing
custom_sku="${10}"
custom_ltm_level="${11}"
custom_afm_level="${12}"
custom_pem_level="${13}"
custom_gtm_level="${14}"

msg=""
stat="FAILURE"
lastError=""
logFile="/var/log/cloud/f5-vnf/cloud_config.log"

restjavad_retries=${10:-10}
restjavad_interval=${11:-10}

function set_vars() {

    if [[ "$tier" == "vnf" ]]; then
        ltm_level="none"
        if [[ "$ric_licensing" == "gilan" ]]; then
            sku="F5-BIG-MSP-NFVGILAN08"
            afm_level="nominal"
            pem_level="nominal" #nominal or none
            gtm_level="none"
        elif [[ "$ric_licensing" == "dns" ]]; then
            sku="F5-BIG-MSP-NFVDNS08"
            afm_level="none"
            pem_level="none"
            gtm_level="nominal"
        elif [[ "$ric_licensing" == "dns_security" ]]; then
            sku="F5-BIG-MSP-NFVDSC08"
            afm_level="nominal"
            pem_level="none"
            gtm_level="nominal"
        else
            sku="F5-BIG-MSP-NFVGIFW08"
            afm_level="nominal"
            pem_level="none"
            gtm_level="none"
        fi
    elif [[ "$tier" == "cgnat" ]]; then
        sku="F5-BIG-MSP-LTM-DAG08"
        ltm_level="none"
        afm_level="nominal"
        pem_level="none"
        gtm_level="none"
    elif [[ "$tier" == "cgnat_offering" ]]; then
        sku="F5-BIG-MSP-NFVGILAN08"
        ltm_level="none"
        afm_level="nominal"
        pem_level="none"
        gtm_level="none"
    elif [[ "$tier" == "custom_tier" ]]; then
        if [[ "$ric_licensing" == "custom_ric_licensing" ]]; then
            echo "Custom licensing ongoing" >> /var/log/cloud/f5-vnf/cloud_config.log
            sku="$custom_sku"
            ltm_level="$custom_ltm_level"
            afm_level="$custom_afm_level"
            pem_level="$custom_pem_level"
            gtm_level="$custom_gtm_level"
        fi
    else
        sku="F5-BIG-MSP-LTM-DAG08"
        ltm_level="nominal"
        afm_level="none"
        pem_level="none"
        gtm_level="none"
    fi

    if [ "$addOnLicenses" == "--add-on None" ]; then
        addOnLicenses=""
    fi

    if [ "$licenseType" == "NO_LIC" ]; then
        license=""
        licenseOpt=""
        addOnLicenses=""
    else
        if [ "$licenseType" == "BIGIQ" ]; then
            licenseOpt="--license-pool --cloud kvm --no-unreachable"
            license="--license-pool-name ${bigIqLicPool} --big-iq-host ${bigIqHost} --big-iq-user ${bigIqUsername} --big-iq-password ${bigIqPwdUri} --sku-keyword-1 ${sku} --unit-of-measure yearly"
        fi
    fi

    bigIpVersion=$(tmsh show sys version | grep "Version" | grep -Po "(\d+\.)+\d+")
    echo "onboard: Detected BIG-IP version: $bigIpVersion" >> /var/log/cloud/f5-vnf/cloud_config.log

    if [[ "${bigIpVersion%%.*}" -ge 14 ]]; then
        echo "onboard: BIG-IP require resetting default credentials" >> /var/log/cloud/f5-vnf/cloud_config.log
        updateCredentials="--set-root-password old:default:new:default --update-user user:admin,password:admin,role:admin,shell:tmsh"
    else
        updateCredentials=""
    fi

    if [[ "$hostName" == "" || "$hostName" == "None" ]]; then
        echo 'onboard: Using mgmt neutron portid as hostname - no fqdn returned from neutron port assignment' >> /var/log/cloud/f5-vnf/cloud_config.log
        # get first matching domain
        dnsSuffix=$(/bin/grep search /etc/resolv.conf | awk '{print $2}')
        if [[ "$dnsSuffix" == "" ]]; then
            dnsSuffix="openstacklocal"
        fi
            hostName="host-$mgmtPortId.$dnsSuffix"
            echo "onboard: Setting hostname to calculated value: $hostName" >> /var/log/cloud/f5-vnf/cloud_config.log
    else
        #remove trailing . from fqdn
        hostName=${hostName%.}
        echo "onboard: Setting hostname to provided value: $hostName" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi

    onboardRun=$(grep "Starting Onboard call" -i -c -m 1 "$logFile" )
    if [ "$onboardRun" -gt 0 ]; then
        echo 'onboard: WARNING: onboard already previously ran.' >> /var/log/cloud/f5-vnf/cloud_config.log

        updateCredentials=""
    fi
}


function restart_all_services() {
    bigstart restart

    for i in {1..1000}; do
        echo "Waiting for BIGIP to restart, trying $i time"
        status=`cat /var/prompt/ps1`

        if [ "$status" == "NO LICENSE" ]; then
            break
        fi

        sleep 1

    done

}


function onboard_run() {
    echo 'onboard: Starting onboard call' >> /var/log/cloud/f5-vnf/cloud_config.log

    for i in {1..60}; do
        if f5-rest-node /config/cloud/f5-vnf/node_modules/@f5devcentral/f5-cloud-libs/scripts/onboard.js \
            $addOnLicenses \
            --host localhost \
            --hostname "$hostName" \
            $licenseOpt $license \
            --log-level debug \
            --module ltm:$ltm_level \
            --module afm:$afm_level \
            --module pem:$pem_level \
            --module gtm:$gtm_level \
            --output "$logFile" \
            --port 443 \
            --user admin --password-url file:///config/cloud/f5-vnf/.adminPwd \
            $updateCredentials \
            --password-encrypted ; then

            # older cloud-libs versions exit with 0 signal
            licenseExists=$(tail $logFile -n 25 | grep "Fault code: 51092" -i -c)

            if [ "$licenseExists" -gt 0 ]; then
                msg="Onboard completed but licensing failed. Error 51092: This license has already been activated on a different unit."
                stat="SUCCESS"
                break
            else
                errorCount=$(tail $logFile -n 25 | grep "BIG-IP onboard failed" -i -c)

                if [ "$errorCount" -gt 0 ]; then
                    lastError=$(grep "error: \[pid" $logFile | tail -n 2)
                    msg="Onboard command failed. See logs for details. Most recent errors: $lastError"
                else
                    msg="Onboard command exited without error."
                    stat="SUCCESS"
                    break
                fi

            fi
        else
            licenseExists=$(tail $logFile -n 25 | grep "Fault code: 51092" -i -c)
            if [ "$licenseExists" -gt 0 ]; then
                msg="Onboard completed but licensing failed. Error 51092: This license has already been activated on a different unit."
                stat="SUCCESS"
                break
            else
                lastError=$(grep "error: \[pid" $logFile | tail -n 2)
                msg="Onboard exited with an error signal. See logs for details. Most recent errors: $lastError"
                # escape \, /, ' and " for json
                msg=${msg//\\/\\\\}
                msg=${msg//\'/\\\'}
                msg=${msg//\//\\\/}
                msg=${msg//\"/\\\"}
            fi
        fi
        restart_all_services

    done
    echo 'onboard: Finished Onboard call'
}

function disable_dhclient() {
    echo "onboard: Disabling dhclient for mgmt nic" >> /var/log/cloud/f5-vnf/cloud_config.log
    tmsh modify sys db dhclient.mgmt { value disable }
    tmsh save sys config
    sleep 5
}

function reset_trust() {
    echo "onboard: Resetting local device trust" >> /var/log/cloud/f5-vnf/cloud_config.log
    tmsh delete cm trust-domain Root
    sleep 10
}

function disable_spp() {
    # Beginning in v14.0.0, Secure Password Policy is enabled by default
    if [[ "${bigIpVersion%%.*}" -ge 14 ]]; then
        echo "onboard: Disabling Secure Password Policy" >> /var/log/cloud/f5-vnf/cloud_config.log
        tmsh modify auth password-policy policy-enforcement disabled
        sleep 5
    fi
}

function modify_mtu {
    # CloudLibs does not support mtu parm for mgmt interface.
    [[ "$mgmt_mtu" =~ "None" ]] && mgmt_mtu="1500" || mgmt_mtu=$(echo -e "${mgmt_mtu}" | grep -o -E "[0-9]+")

    echo "onboard-network-nic: Changing MTU to default for management-route ($mgmt_mtu)" >> /var/log/cloud/f5-vnf/cloud_config.log
    ifconfig mgmt mtu $mgmt_mtu up
    tmsh modify sys management-route default mtu $mgmt_mtu
    sleep 4
}

function create_data_group() {
    echo "onboard: Creating VNF data group" >> /var/log/cloud/f5-vnf/cloud_config.log
    if [[ "$tier" == "dag"  || "$tier" == "cgnat_offering" ]]; then
        if tmsh create ltm data-group internal vnf_map type string; then
            echo "onboard: Successfully created VNF map data group" >> /var/log/cloud/f5-vnf/cloud_config.log
        else
            echo "onboard: Could not create VNF map data group" >> /var/log/cloud/f5-vnf/cloud_config.log
        fi
    else
        echo "onboard: We are not DAG, not creating VNF map data group" >> /var/log/cloud/f5-vnf/cloud_config.log
    fi
}

function print_msg() {
    echo -e "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
    echo '*****ONBOARD FINISHED******' >> /var/log/cloud/f5-vnf/cloud_config.log
}

function add_custom_trap() {

    echo "alert INET_PORT_EXHAUSTION \"Inet port exhaustion (.*)\" {
        snmptrap OID=\".1.3.6.1.4.1.3375.2.4.0.500\"
    }" >> /config/user_alert.conf
    bigstart restart alertd
}

function restart_restjavad() {
    echo "Restarting restjavad before/after onboarding " >> /var/log/cloud/f5-vnf/cloud_config.log
    bigstart restart restjavad restnoded
}

function log() {
  message=${1}

  printf "%s await_restjavad:  %s\n" "$(date --utc '+%FT%T.%3NZ')" "${message}" >> /var/log/cloud/f5-vnf/cloud_config.log
}

function await_restjavad() {

  for i in  $(seq 1 ${restjavad_retries});
  do
    restjavad_state=$(timeout ${restjavad_interval} restcurl shared/echo | jq .stage | sed 's/"//g')

    if [ $restjavad_state == "STARTED" ]
    then
      log "restjavad is up: ${restjavad_state}"
      return 0
    else
      log "restjavad is down: ${restjavad_state}"
      sleep ${restjavad_interval}
    fi
  done

  return 1
}


function main() {
    set_vars
    restart_restjavad
    await_restjavad
    #disable_spp
    modify_mtu
    onboard_run
    disable_dhclient
    create_data_group
    reset_trust
    add_custom_trap
    restart_restjavad
    await_restjavad
    print_msg
}

main
