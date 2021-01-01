# 1. Use conf file
#### 1.1. Edit file .conf in /etc/sites-available/
#### 1.2. Link to /etc/sites-enabled/
```shell
  # ln -s source destination
  sudo ln -s /etc/nginx/sites-available/nguyenthotuan.me.conf /etc/nginx/sites-enabled/
```

# 2. HTTPS with certbot
+ ### If you have ssl certificate, config like [here](sites-available/nguyenthotuan.me.conf) and specific **ssl_certificate** and **ssl_certificate_key** like
```shell
cp nginx/ssl/ssl-bundle.crt /etc/ssl/certs/
cp nginx/ssl/nguyenthotuan.me.key /etc/ssl/private/
```
> About ssl .crt & .key: https://comodosslstore.com/blog/installing-comodo-positivessl-certificate-on-nginx.html
+ ### If you not have ssl source just config like [here](sites-available/nttuan.live.conf) and use certbot auto generate ssl below:
#### With ubuntu <= 18
```shell
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Only valid for 90 days, test the renewal process with
certbot renew --dry-run
```
### ubuntu >= 20
```shell
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com

# Only valid for 90 days, test the renewal process with
certbot renew --dry-run
```
> See more: https://certbot.eff.org/lets-encrypt/ubuntufocal-other

# 3. Install nginx from source

```shell
sudo apt update
sudo apt install build-essential -y
sudo apt-get install manpages-dev -y
sudo apt-get install libpcre3 libpcre3-dev -y
sudo apt-get install libpcre3=2:8.39-12build1 libpcre3-dev=2:8.39-12build1 -y
sudo apt-get install libssl-dev -y
sudo apt install zlib1g zlib1g-dev -y

mkdir /$HOME/build && cd /$HOME/build
wget https://github.com/vkholodkov/nginx-upload-module/archive/2.3.0.tar.gz
wget http://nginx.org/download/nginx-1.18.0.tar.gz
tar xzf 2.3.0.tar.gz
tar xzf nginx-1.18.0.tar.gz

cd nginx-1.18.0
./configure --sbin-path=/usr/bin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx.pid \
    --with-http_ssl_module --with-pcre \
    --add-module=../nginx-upload-module-2.3.0
make
make install
```

> See more: https://tonyteaches.tech/how-to-build-nginx-from-source/

# 4. References:
1. https://gist.github.com/bradtraversy/cd90d1ed3c462fe3bddd11bf8953a896
2. https://certbot.eff.org/lets-encrypt/ubuntufocal-other
3. https://tonyteaches.tech/how-to-build-nginx-from-source/
