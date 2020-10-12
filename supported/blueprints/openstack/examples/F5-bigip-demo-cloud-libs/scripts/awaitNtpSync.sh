#!/bin/bash

ntp_sync_retries=${1:-10}
ntp_sync_interval=${2:-10}

function log() {
  message=${1}

  printf "%s awaitNtpSync:  %s\n" "$(date --utc '+%FT%T.%3NZ')" "${message}" >> /var/log/cloud/f5-vnf/cloud_config.log  
}


function await_sync() {
  
  for i in  $(seq 1 ${ntp_sync_retries});
  do
    ntp_state=$(ntpstat)
    if [ $? -eq 0 ]
    then
      log "NTP in sync: ${ntp_state}"
      return 0
    else
      log "NTP not in sync: ${ntp_state}"
      sleep ${ntp_sync_interval}
    fi
  done
  
  return 1
}

function main() {
log "******Starting NTP sync script******"

  if await_sync
  then
    log "NTP sync successful"
  else
    log "NTP sync failed"
  fi

log "******Finished NTP sync script******"
}

main
