#!/bin/bash

ntp=${1}
tz=${2}

echo '*****NTP_CONFIG STARTING******' >> /var/log/cloud/f5-vnf/cloud_config.log

f5-rest-node /config/cloud/f5-vnf/node_modules/@f5devcentral/f5-cloud-libs/scripts/onboard.js \
  --host localhost --ntp "${ntp}" --tz "${tz}" --user admin --password-url file:///config/cloud/f5-vnf/.adminPwd --password-encrypted
bigstart stop ntpd
ntpdate -s ${ntp}
bigstart start ntpd

echo '*****NTP_CONFIG FINISHED******' >> /var/log/cloud/f5-vnf/cloud_config.log
 
