echo '=========================>> Install Nodejs <========================='
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt update
sudo apt-get install -y nodejs

echo '=========================>> Install Go <========================='
apt-get install -y build-essential
wget https://dl.google.com/go/go1.16.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz
rm go1.16.4.linux-amd64.tar.gz

echo '=========================>> Setting environments <========================='
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.zshrc
echo "$USER soft nofile 8096" | sudo tee -a /etc/security/limits.conf > /dev/null
echo "$USER hard nofile 8096" | sudo tee -a /etc/security/limits.conf > /dev/null
sudo apt install make
sudo apt install unzip
exit