#!/bin/bash
clear
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m            XRAY - MENU            \E[0m"
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""   
echo -e " [\e[36m•1\e[0m] Add Vmess WS/GRPC  "
echo -e " [\e[36m•2\e[0m] Add Vless WS/GRPC  "
echo -e " [\e[36m•3\e[0m] Add Trojan WS/GRPC  "
echo -e " [\e[36m•4\e[0m] Add Sodosok WS/GRPC  "
echo -e " [\e[36m•5\e[0m] Del User"
echo -e " [\e[36m•6\e[0m] Cek User"
echo -e " [\e[36m•7\e[0m] Renew User"
echo -e " [\e[36m•8\e[0m] Cek Usage"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e  "Press x or [ Ctrl+C ] • To-Exit"
echo -e ""
echo -e "\e[36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; addws;;
2) clear ; addvless ;;
3) clear ; addtr;;
4) clear ; addss ;;
5) clear ; del-user ;;
6) clear ; cek-user ;;
7) clear ; renew-user ;;
8) clear ; cek-usage ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back on menu" ; sleep 1 ; menu ;;
esac
