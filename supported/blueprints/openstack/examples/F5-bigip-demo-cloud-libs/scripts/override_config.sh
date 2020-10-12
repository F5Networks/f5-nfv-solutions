#!/bin/bash
echo '******Overriding Default Configuration******' >> /var/log/cloud/f5-vnf/cloud_config.log

#vars - TODO - pass it as arguments to script
disable1Nic="${1}"
admin_password="${2}"
root_password="${3}"
bigIpVersion=$(tmsh show sys version | grep "Version" | grep -Po "(\d+\.)+\d+")

if [ "$disable1Nic" == "True" ]; then
    /usr/bin/setdb provision.1nicautoconfig disable
fi

if [[ "${bigIpVersion%%.*}" -ge 14 ]]; then
    echo 'override-config: Disabling Secure Password Policy' >> /var/log/cloud/f5-vnf/cloud_config.log
    tmsh modify auth password-policy policy-enforcement disabled
    sleep 4
fi

echo 'override-config: Settings defaults passwords.' >> /var/log/cloud/f5-vnf/cloud_config.log
/usr/bin/passwd admin "$admin_password" >/dev/null 2>&1
/usr/bin/passwd root "$root_password" >/dev/null 2>&1

mkdir -m 0755 -p /config/cloud/f5-vnf
mkdir -m 0755 -p /mnt/creds
cd /config/cloud/f5-vnf
echo "$admin_password" >> /mnt/creds/.adminPwd

if [[ "${bigIpVersion%%.*}" -ge 14 ]]; then
    echo "override-config: BIG-IP require resetting default credentials" >> /var/log/cloud/f5-vnf/cloud_config.log
    echo "override-config: Restarting restjavad before onboarding to reset brute force counter" >> /var/log/cloud/f5-vnf/cloud_config.log
    bigstart restart restjavad restnoded
fi

echo '******Finished Overriding Default Configuration******' >> /var/log/cloud/f5-vnf/cloud_config.log

