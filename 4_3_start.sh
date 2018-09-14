#echo "Root password"
#read -s root
read -p "Enter Username: " uname
echo -e "Enter Password: \c"
read -s passwd
echo $uname > vpnpass.txt
echo $passwd >> vpnpass.txt
#echo $root >> vpnpass.txt
content=$(cat /etc/resolv.conf)
#echo $content
dns="nameserver 10.4.20.204"
wget -q --http-user=$uname --http-password=$passwd https://vpn.iiit.ac.in/secure/ubuntu.ovpn
sudo openvpn --config ubuntu.ovpn --auth-user-pass vpnpass.txt --daemon
#sudo resolvconf -u
sudo chmod 777 /etc/resolv.conf;
sudo echo $dns > /etc/resolv.conf;
echo
echo "VPN started"