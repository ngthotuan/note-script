echo '=========================>> Install Docker <========================='
sudo apt update &&
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt update &&
sudo apt install -y docker-ce &&
sudo usermod -aG docker ${USER} &&
su - ${USER} &&
id -nG &&
echo '=========================>> Install Docker Compose <========================='
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
docker-compose --version

echo '=========================>> Install ZSH <========================='
sudo apt-get install zsh -y &&
sudo curl -L http://install.ohmyz.sh | sh &&
chsh -s $(which zsh) &&
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc &&
echo 'alias dpsa="docker ps -a"' >> ~/.zshrc &&
echo 'alias di="docker images"' >> ~/.zshrc &&
echo 'alias de="docker exec -it"' >> ~/.zshrc &&
echo 'alias dc="docker-compose"' >> ~/.zshrc &&
echo 'alias dcu="docker-compose up -d"' >> ~/.zshrc &&
echo 'alias dcub="docker-compose up -d --build"' >> ~/.zshrc &&
echo 'alias dcd="docker-compose down"' >> ~/.zshrc

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