## 1. Some Information need to set in setenv
- USER=root => User
- HOST=10.10.10.10 => Host IP
- SSH_PORT=22 => SSH port
- UPLOAD_PATH=/home/nttuan => Path to upload on server
- PROJECT_NAME=nguyenthotuan.me => Specific your project name 
- ROOT_PATH=../..
 => Specific local2server folder with 'your project' dir
  + EX1: YourProject/local2server => ROOT_PATH=..
  + EX2: YourProject/deploy/local2server => ROOT_PATH=../..
    
## 2. Exclude files / directories ?

- Always exclude .git folder and follow .gitignore file
- Custom your exclude edit `exclude.txt` [here](exclude.txt) by follow [.gitignore](https://git-scm.com/docs/gitignore)