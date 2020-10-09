#!/bin/bash
echo '******Starting Cluster Configuration******' >> /var/log/cloud/f5-vnf/cloud_config.log

logFile="/var/log/cloud/f5-vnf/cloud_config.log"
msg=""
stat="FAILURE"
host="127.0.0.1"
dfl_mgmt_port='443'
passwd=${1}

masterIp=${2}
mgmtIp=${3}
configSyncIp=${4}
configSyncCidr=${5}
configSyncVlan=${6}
autoSync=${7}
saveOnAutoSync=${8}
deviceName=${9}

if [[ "$autoSync" == "True" ]]; then
    autoSync="--auto-sync"
    if [[ "$saveOnAutoSync" == "True" ]]; then
        saveOnAutoSync="--save-on-auto-sync"
    else
        saveOnAutoSync=""
    fi
else
    autoSync=""
    saveOnAutoSync=""
fi

isMaster=false
if [[ "$masterIp" == "master" ]]; then
    echo 'onboard-cluster: Master VE is being initialized' >> /var/log/cloud/f5-vnf/cloud_config.log
    isMaster=true
fi
deviceCurr=$(tmsh list cm device | grep bigip1 -c)
if [[ "$deviceCurr" -gt 0 ]]; then
  echo 'onboard-cluster: Warning: DeviceName is showing as default bigip1. Manually changing' >> /var/log/cloud/f5-vnf/cloud_config.log

  if [[ "$deviceName" == "" || "$deviceName" == "None"  ]]; then
    echo 'onboard-cluster: Building hostname manually - no fqdn returned from neutron port assignment' >> /var/log/cloud/f5-vnf/cloud_config.log
    dnsSuffix=$(/bin/grep search /etc/resolv.conf |n awk '{print $2}')
    deviceName="host-$mgmtIp.$dnsSuffix"
  else
    deviceName=${deviceName%.}
  fi
  echo "onboard-cluster: Changing deviceName from bigip1 to: $deviceName" >> /var/log/cloud/f5-vnf/cloud_config.log
  tmsh mv cm device bigip1 "$deviceName"
else
  hostName=$(tmsh list cm device one-line | awk '{print $3}')
  deviceName="$hostName"
  echo "onboard-cluster: Setting deviceName to hostname: $hostName" >> /var/log/cloud/f5-vnf/cloud_config.log
fi

echo 'Configuring config-sync ip'
if [[ $(tmsh list net self | grep "address $configSyncIp" -c) == 0 ]]; then
    echo 'onboard-cluster: Configuring cluster self-ip' >> /var/log/cloud/f5-vnf/cloud_config.log
    tmsh create net self cluster_self address "$configSyncIp/$configSyncCidr" vlan "$configSyncVlan" allow-service add { tcp:4353 udp:1026 tcp:443 }
else
    echo 'onboard-cluster: Ensuring correct port lockdown configured for cluster ip' >> /var/log/cloud/f5-vnf/cloud_config.log
    cluster_self=$(tmsh list net self | grep "address $configSyncIp" -C 1 | grep self | awk '{print $3}')
    tmsh modify net self "$cluster_self" allow-service add { tcp:4353 udp:1026 tcp:443 }
fi
tmsh modify cm device "$deviceName" configsync-ip $configSyncIp mirror-ip $configSyncIp unicast-address { { effective-ip $configSyncIp effective-port 1026 ip $configSyncIp } }

echo 'onboard-cluster: Reconciling hostname' >> /var/log/cloud/f5-vnf/cloud_config.log
tmsh modify sys global-settings hostname "$deviceName"

if [[ "$isMaster" == true ]] ; then
echo 'onboard-cluster: Config-Sync master device' >> /var/log/cloud/f5-vnf/cloud_config.log
    f5-rest-node /config/cloud/f5-vnf/node_modules/@f5devcentral/f5-cloud-libs/scripts/cluster.js \
    --output "${logFile}" \
    --log-level debug \
    --host $mgmtIp \
    --user admin \
    --password $passwd \
    --port $dfl_mgmt_port \
    --create-group \
    --device-group Sync \
    --sync-type sync-failover \
    --device "$deviceName" \
    --network-failover \
    "$autoSync" \
    "$saveOnAutoSync"
fi

onboardClusterErrorCount=$(tail /var/log/cloud/f5-vnf/cloud_config.log -n 25 | grep "cluster failed" -i -c)

if [ "$onboardClusterErrorCount" -gt 0 ]; then
    msg="onboard-cluster: command exited with error. See /var/log/cloud/f5-vnf/cloud_config.log for details."
else
    stat="SUCCESS"
    msg="onboard-cluster: command exited without error."
fi

msg="$msg *** Instance: $deviceName"
echo "$msg" >> /var/log/cloud/f5-vnf/cloud_config.log
