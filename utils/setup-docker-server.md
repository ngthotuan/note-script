# 1. Script auto config server
sudo apt update &&
sudo apt-get install zsh -y &&
sudo curl -L http://install.ohmyz.sh | sh &&
chsh -s $(which zsh) &&
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc &&
mkdir /appdata && chmod 777 /appdata &&
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt update &&
sudo apt install -y docker-ce &&
sudo usermod -aG docker ${USER} &&
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
docker-compose --version &&
sudo apt install -y nginx


# 2. Easy deploy with portaner - nginx proxy manager
## 2.1 Docker - Docker compose - Portainer - Nginx Proxy Manager
sudo apt update &&
sudo apt-get install zsh -y &&
sudo curl -L http://install.ohmyz.sh | sh &&
chsh -s $(which zsh) &&
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc &&
mkdir /appdata && chmod 777 /appdata &&
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt update &&
sudo apt install -y docker-ce &&
sudo usermod -aG docker ${USER} &&
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
docker-compose --version &&
mkdir -p /opt/portainer-nginx/ && cd $_ &&
wget -O docker-compose.yml https://raw.githubusercontent.com/ngthotuan/note-script/main/docker-compose/portainer-nginx.yml &&
docker-compose up -d
## 2.2 Docker - Docker compose - Nginx Proxy Manager
sudo apt update &&
sudo apt-get install zsh -y &&
sudo curl -L http://install.ohmyz.sh | sh &&
chsh -s $(which zsh) &&
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc &&
mkdir /appdata && chmod 777 /appdata &&
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt update &&
sudo apt install -y docker-ce &&
sudo usermod -aG docker ${USER} &&
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
docker-compose --version &&
mkdir -p /opt/nginx-proxy-manager/ && cd $_ &&
wget -O docker-compose.yml https://raw.githubusercontent.com/ngthotuan/note-script/main/docker-compose/nginx-proxy-manager.yml &&
docker-compose up -d


## 2.3 MailServer
### REPLACE YOUR HOSTNAME
HOSTNAME=nttuan.live &&
sudo apt-get install subversion -y &&
svn export https://github.com/ngthotuan/note-script/trunk/docker-compose/mailserver &&
mv mailserver /opt/ &&
cd /opt/mailserver/ &&
chmod -R u+x $PWD &&
cp .env.dist .env &&
sed -i "s/example.com/$HOSTNAME/g" .env &&
bin/production.sh up -d 
### RUN THIS TO CONFIG -> GO TO IP:81
bin/production.sh run --rm web setup.sh
