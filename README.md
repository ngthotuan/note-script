# INSTALL ZSH
```shell
sudo apt-get install zsh -y &&
sudo curl -L http://install.ohmyz.sh | sh &&
chsh -s $(which zsh) &&
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions &&
echo 'source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

```
# INSTALL NodeJS - PM2 - NGINX
```shell
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&
sudo apt update &&
sudo apt-get install -y nodejs &&
sudo npm install -g pm2 &&
pm2 startup systemd &&
sudo apt install -y nginx
```
> See more: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-16-04
# UFW
```shell
ufw enable
ufw allow ssh
ufw allow http
ufw allow https
sudo systemctl stop nginx
sudo systemctl start nginx
```

# INSTALL DOCKER
```shell
sudo apt update &&
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &&
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" &&
sudo apt update &&
sudo apt install -y docker-ce &&
sudo usermod -aG docker ${USER} &&
su - ${USER} &&
id -nG
```
Add user to docker: sudo usermod -aG docker 'username'
> See more: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04#step-1-%E2%80%94-installing-docker
# INSTALL docker-compose 1.27.4
```shell
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose &&
sudo chmod +x /usr/local/bin/docker-compose &&
docker-compose --version
```
> See more: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04