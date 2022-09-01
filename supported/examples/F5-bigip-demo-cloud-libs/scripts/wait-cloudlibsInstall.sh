#!/bin/bash

function wait_cloud_libs_install() {
    while true; do echo 'wait-cloudLibsInstall: Waiting for cloud libs install to complete' >> /var/log/cloud/f5-vnf/cloud_config.log
        if [ -f /config/cloud/f5-vnf/cloudLibsReady ]; then
            break
        else
            sleep 10
        fi
    done
}

function main() {
    wait_cloud_libs_install
}

main
