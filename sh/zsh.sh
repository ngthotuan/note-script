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
echo 'alias dcf="docker-compose --file"' >> ~/.zshrc &&
echo 'alias dcu="docker-compose up -d"' >> ~/.zshrc &&
echo 'alias dcub="docker-compose up -d --build"' >> ~/.zshrc &&
echo 'alias dcd="docker-compose down"' >> ~/.zshrc