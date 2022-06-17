#!/bin/bash
clear
domain=$(cat /root/domain)
read -rp "User: " -e user
egrep -w "^### $user" /usr/local/etc/xray/config.json >/dev/null
if [ $? -eq 0 ]; then
echo -e "Username Sudah Ada"
exit 0
fi
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojangrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#trojanws$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
systemctl restart xray
trojanlink="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=bug.com&type=ws&sni=bug.com#${user}"
clear
echo -e ""
echo -e "=============-TROJAN-============"
echo -e "Remarks        : ${user}"
echo -e "Host/IP        : ${domain}"
echo -e "port           : 443"
echo -e "Key            : ${uuid}"
echo -e "Path           : trojan-grpc"
echo -e "================================="
echo -e "GRPC           : ${trojanlink}"
echo -e "================================="
echo -e "WS             : ${trojanlink1}"
echo -e "================================="
echo -e "Expired On     : $exp"
