#!/usr/bin
Bacain(){
clear
read -rp "Domain: " -e domain
read -rp "Token: " -e token
read -rp "Quota - Isi 0 Untuk Unlimited -: " -e gb
}
Vmess(){
Bacain
data=($(cat paradis.json | grep '^###ws' | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
    exp=$(grep -w "^###ws $user" "paradis.json" | cut -d ' ' -f 3 | sort | uniq)
    uuid=$(grep -w "^###ws $user" "paradis.json" | cut -d ' ' -f 4 | sort | uniq)
    time=$(date -d "$exp" +"%s")
    limit=$(($gb * 1024**3))
    if [[ ${#user} -gt 0 ]]; then
     curl -X 'POST' \
       'https://'${domain}'/api/user' \
       -H 'accept: application/json' \
       -H 'Authorization: Bearer '${token}'' \
       -H 'Content-Type: application/json' \
       -d '{
       "username": "'"${user}"'",
       "proxies": {
         "vmess": {
           "id": "'"${uuid}"'"
          }
       },
       "inbounds": {
         "vmess": [
           "VMESS_WS"
         ]
       },
       "expire": "'"${time}"'",
       "data_limit": "'"${limit}"'",
       "data_limit_reset_strategy": "no_reset",
       "status": "active",
       "note": ""
     }' >/dev/null 2>&1
       echo -e "${user} $time $uuid OKE"    
     fi
done
}
Trojan(){
Bacain
data=($(cat drawit.json | grep '^###ws' | cut -d ' ' -f 2 | sort | uniq))
for user in "${data[@]}"; do
    exp=$(grep -w "^###ws $user" "drawit.json" | cut -d ' ' -f 3 | sort | uniq)
    uuid=$(grep -w "^###ws $user" "drawit.json" | cut -d ' ' -f 4 | sort | uniq)
    time=$(date -d "$exp" +"%s")
    limit=$(($gb * 1024**3))
    if [[ ${#user} -gt 0 ]]; then
     curl -X 'POST' \
       'https://'${domain}'/api/user' \
       -H 'accept: application/json' \
       -H 'Authorization: Bearer '${token}'' \
       -H 'Content-Type: application/json' \
       -d '{
       "username": "'"${user}"'",
       "proxies": {
         "trojan": {
           "password": "'"${uuid}"'"
          }
       },
       "inbounds": {
         "trojan": [
           "TROJAN_WS"
         ]
       },
       "expire": "'"${time}"'",
       "data_limit": "'"${limit}"'",
       "data_limit_reset_strategy": "no_reset",
       "status": "active",
       "note": ""
     }' >/dev/null 2>&1
       echo -e "${user} $time $uuid OKE"    
     fi
done
}
Main(){
echo "Apalah Daya...."
echo  " 1 conn VMess"
echo  " 2 conn TRojan"
read -p "Masukkan nomor pilihan Anda: " choice
case $choice in
    1)
        clear
        Vmess
        ;;
    2)
        clear
        Trojan
        ;;
    *)
        echo "Pilihan tidak valid."
        exit 1
        ;;
esac
}
Main
