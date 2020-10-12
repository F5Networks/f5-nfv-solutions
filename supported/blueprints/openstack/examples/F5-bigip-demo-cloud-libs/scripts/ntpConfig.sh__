#!/bin/bash
echo '*****ONBOARD STARTING******' >> /var/log/cloud/f5-vnf/cloud_config.log

#vars
#some default values set by heat str_replace

#licensing
licenseOpt=""
license=""
addOnLicenses=""
licenseType="BIGIQ"



bigIqHost="${1}"
bigIqUsername="${2}"
bigIqLicPool="${3}"
bigIqPwdUri="${4}"

bigIqMgmtIp="${1}"
bigIqMgmtPort=""
mgmtPortId="${5}"
tier="${6}"
hostName="${7}"
ric_licensing="${8}"
ntp="${9}"
tz="${10}"

msg=""
stat="FAILURE"
lastError=""
logFile="/var/log/cloud/f5-vnf/cloud_config.log"

function set_vars() {
    mkdir -p /var/log/cloud/f5-vnf/ && touch ${logFile}

    if [[ "$tier" == "vnf" ]]; then
        ltm_level="none"
        if [[ "$ric_licensing" == "gilan" ]]; then
            sku="F5-BIG-MSP-NFVGILAN08"
            afm_level="nominal"
            pem_level="nominal"
        else
            sku="F5-BIG-MSP-NFVGIFW08"
            afm_level="nominal"
            pem_level="none"
        fi
    else
        sku="F5-BIG-MSP-LTM-DAG08"
        ltm_level="nominal"
        afm_level="none"
        pem_level="none"
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
            license="--license-pool-name ${bigIqLicPool} --big-iq-host ${bigIqHost} --big-iq-user ${bigIqUsername} --big-iq-password ${bigIqPwdUri} --sku-keyword-1 ${sku} --unit-of-measure yearly ${bigIqMgmtIp} ${bigIqMgmtPort}"
        fi
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
    fi
}

function onboard_run() {
    echo 'onboard: Starting onboard call' >> /var/log/cloud/f5-vnf/cloud_config.log
    if f5-rest-node /config/cloud/f5-vnf/node_modules/@f5devcentral/f5-cloud-libs/scripts/onboard.js \
        $addOnLicenses \
        --host localhost \
        --hostname "$hostName" \
        $licenseOpt $license \
        --log-level debug \
        --module ltm:$ltm_level \
        --module afm:$afm_level \
        --module pem:$pem_level \
        --output "$logFile" \
        --port 443 \
        --tz $tz \
        --ntp $ntp \
        --user admin --password-url file:///config/cloud/f5-vnf/.adminPwd \
        --password-encrypted ; then

        # older cloud-libs versions exit with 0 signal
        licenseExists=$(tail $logFile -n 25 | grep "Fault code: 51092" -i -c)

        if [ "$licenseExists" -gt 0 ]; then
            msg="Onboard completed but licensing failed. Error 51092: This license has already been activated on a different unit."
            stat="SUCCESS"
        else
            errorCount=$(tail $logFile -n 25 | grep "BIG-IP onboard failed" -i -c)

            if [ "$errorCount" -gt 0 ]; then
                lastError=$(grep "error: \[pid" $logFile | tail -n 2)
                msg="Onboard command failed. See logs for details. Most recent errors: $lastError"
            else
                msg="Onboard command exited without error."
                stat="SUCCESS"
            fi

        fi
    else
        licenseExists=$(tail $logFile -n 25 | grep "Fault code: 51092" -i -c)
        if [ "$licenseExists" -gt 0 ]; then
            msg="Onboard completed but licensing failed. Error 51092: This license has already been activated on a different unit."
            stat="SUCCESS"
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

function create_data_group() {
    echo "onboard: Creating VNF data group" >> /var/log/cloud/f5-vnf/cloud_config.log
    if [[ "$tier" != "vnf" ]]; then
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

function main() {
    set_vars
    onboard_run
    disable_dhclient
    create_data_group
    reset_trust
    print_msg
}

main
