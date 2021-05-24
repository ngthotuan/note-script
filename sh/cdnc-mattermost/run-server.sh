echo '=========================>> Clone and run project <========================='
git clone https://github.com/chudenangcao2021/mattermost-server.git
cd mattermost-server
make run-server
curl http://localhost:8065/api/v4/system/ping