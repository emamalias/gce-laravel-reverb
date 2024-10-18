sudo su

cd ~

apt update && apt install -y openssl curl git docker-compose

mkdir -p /etc/letsencrypt/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/letsencrypt/ssl/privkey.pem \
    -out /etc/letsencrypt/ssl/fullchain.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=ws.yourdomain.com"

# Permissions for SSL certificates
chmod 600 /etc/letsencrypt/ssl/privkey.pem /etc/letsencrypt/ssl/fullchain.pem

apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --batch --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
apt update && apt install docker-ce docker-compose -y

apt install nodejs -y

# clone repo
git clone https://github.com/emamalias/gce-laravel-reverb.git laravel-web-socket

#
cd ~/laravel-web-socket/src

#
cp .env.example .env

# Update .env values
sed -i '
s|APP_URL=.*|APP_URL=http://ws.yourdomain.com/|;
s|APP_NAME=.*|APP_NAME=WebSocket|;
s|DB_CONNECTION=.*|DB_CONNECTION=mysql|;
s|DB_HOST=.*|DB_HOST=mysql|;
s|DB_PORT=.*|DB_PORT=3306|;
s|DB_DATABASE=.*|DB_DATABASE=w3c-sockets|;
s|DB_USERNAME=.*|DB_USERNAME=root|;
s|DB_PASSWORD=.*|DB_PASSWORD=yourawesomemysqlpassword|;
s|BROADCAST_DRIVER=.*|BROADCAST_DRIVER=reverb|;
s|QUEUE_CONNECTION=.*|QUEUE_CONNECTION=redis|;
s|REDIS_CLIENT=.*|REDIS_CLIENT=predis|;
s|REDIS_HOST=.*|REDIS_HOST=redis|;
s|REDIS_PASSWORD=.*|REDIS_PASSWORD=null|;
s|REDIS_PORT=.*|REDIS_PORT=6379|;
s|REVERB_APP_ID=.*|REVERB_APP_ID=562669|;
s|REVERB_APP_KEY=.*|REVERB_APP_KEY=yourreverbappkey|;
s|REVERB_APP_SECRET=.*|REVERB_APP_SECRET=yourreverbappsecret|;
s|REVERB_SERVER_HOST=.*|REVERB_SERVER_HOST=0.0.0.0|;
s|REVERB_SERVER_PORT=.*|REVERB_SERVER_PORT=8080|;
s|REVERB_HOST=.*|REVERB_HOST=ws.yourdomain.com|;
s|REVERB_PORT=.*|REVERB_PORT=443|;
s|REVERB_SCHEME=.*|REVERB_SCHEME=https|
' .env

cd ~/laravel-web-socket

cp startup_script.sh.example startup_script.sh

chmod +x startup_script.sh

./startup_script.sh
