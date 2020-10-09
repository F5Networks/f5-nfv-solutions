#!/bin/bash
echo '******Starting Encrypt Script******' >> /var/log/cloud/f5-vnf/cloud_config.log
adminPwd='/config/cloud/f5-vnf/.adminPwd'

function encrypt_creds() {
    adminPwdTmp='/mnt/creds/.adminPwd'

    if f5-rest-node /config/cloud/f5-vnf/node_modules/@f5devcentral/f5-cloud-libs/scripts/encryptDataToFile.js \
        --data-file "$adminPwdTmp" \
        --out-file "$adminPwd" ; then

        echo 'encrypt: Successfully encrypted admin password.' >> /var/log/cloud/f5-vnf/cloud_config.log
    else
        echo 'encrypt: Unable to encrypt admin pwd.' >> /var/log/cloud/f5-vnf/cloud_config.log
    fi

    # encrypt additional creds here as needed
}

function wait_for_password_encryption() {
    while true; do echo 'encrypt: Waiting for password encryption to complete'
        if [ -f ${adminPwd} ]; then
            break
        else
            sleep 10
            encrypt_creds
        fi
    done

}

function main() {
    encrypt_creds
    wait_for_password_encryption
    echo '******Finished Encrypt Script******' >> /var/log/cloud/f5-vnf/cloud_config.log
}

main
