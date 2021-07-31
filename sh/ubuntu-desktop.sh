# Run as sudo first
# sudo apt-get update -> enter password
# edit PASS env and run script

echo '=========================>> SETUP ENV <========================='
PASS=123
# echo $USER:$PASS | sudo chpasswd

echo '=========================>> INSTALL ZSH <========================='
sudo apt-get install zsh -y
sudo curl -L http://install.ohmyz.sh | sh
echo $PASS | chsh -s $(which zsh)
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

echo '=========================>> Install Nodejs <========================='
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt update
sudo apt-get install -y nodejs

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
echo 'alias dpsa="docker ps -a"' >> ~/.zshrc
echo 'alias di="docker images"' >> ~/.zshrc
echo 'alias de="docker exec -it"' >> ~/.zshrc
echo 'alias dc="docker-compose"' >> ~/.zshrc
echo 'alias dcf="docker-compose --file"' >> ~/.zshrc
echo 'alias dcu="docker-compose up -d"' >> ~/.zshrc
echo 'alias dcub="docker-compose up -d --build"' >> ~/.zshrc
echo 'alias dcd="docker-compose down"' >> ~/.zshrc

echo '=========================>> Install JAVA & MAVEN <========================='
sudo apt-get install -y openjdk-11-jdk
sudo apt install -y maven
echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64' >> ~/.zshrc
echo 'export MAVEN_HOME=/usr/share/maven' >> ~/.zshrc