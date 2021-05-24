echo '=========================>> Clone project <========================='
rm -rf mattermost-webapp
git clone https://github.com/chudenangcao2021/mattermost-webapp.git

echo '=========================>> Link client forder to server <========================='
mkdir -p mattermost-webapp/dist
cd mattermost-server
ln -nfs ../mattermost-webapp/dist client
cd ..

echo '=========================>> Run test <========================='
cd mattermost-webapp
make test

echo '=========================>> Run app <========================='
make run