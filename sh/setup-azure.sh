
echo '=========================>> SETUP ENV <========================='
PASS=123
echo $USER:$PASS | sudo chpasswd

echo '=========================>> INSTALL ZSH <========================='
sudo apt-get install zsh -y
sudo curl -L http://install.ohmyz.sh | sh
echo $PASS | chsh -s $(which zsh)
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc
echo 'alias dpsa="docker ps -a"' >> ~/.zshrc
echo 'alias di="docker images"' >> ~/.zshrc
echo 'alias de="docker exec -it"' >> ~/.zshrc
echo 'alias dc="docker-compose"' >> ~/.zshrc
echo 'alias dcf="docker-compose --file"' >> ~/.zshrc
echo 'alias dcu="docker-compose up -d"' >> ~/.zshrc
echo 'alias dcub="docker-compose up -d --build"' >> ~/.zshrc
echo 'alias dcd="docker-compose down"' >> ~/.zshrc


echo '=========================>> INSTALL DOCKER - DOCKER-COMPOSE <========================='
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install -y docker-ce
echo $PASS | sudo usermod -aG docker ${USER}
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version