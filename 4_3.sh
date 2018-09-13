#echo "Root password"
#read -s root
read -p "Enter Username: " uname
echo -e "Enter Password: \c"
read -s passwd
echo $uname > vpnpass.txt
echo $passwd > vpnpass.txt
#echo $root >> vpnpass.txt
wget --http-user=$uname --http-password=$passwd https://vpn.iiit.ac.in/secure/ubuntu.ovpn
sudo openvpn --config ubuntu.ovpn --auth-user-pass vpnpass.txt
