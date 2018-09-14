dns="nameserver 127.0.0.53"
sudo killall openvpn
sudo chmod 777 /etc/resolv.conf;
sudo echo $dns > /etc/resolv.conf;
echo
echo "VPN stopped"