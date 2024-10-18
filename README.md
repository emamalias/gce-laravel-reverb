```bash
cp startup_script.sh.example startup_script.sh
```

Replace important variables
```bash
sed -i 's/APP_URL=.*/APP_URL=http://ws.yourawesomedomain.com/' .env

sed -i 's/APP_NAME=.*/APP_NAME="WebSocket"/' .env
sed -i 's/DB_CONNECTION=.*/DB_CONNECTION="mysql"/' .env
sed -i 's/DB_HOST=.*/DB_HOST="mysql"/' .env
sed -i 's/DB_PORT=.*/DB_PORT="3306"/' .env
sed -i 's/DB_DATABASE=.*/DB_DATABASE="w3c-sockets"/' .env
sed -i 's/DB_USERNAME=.*/DB_USERNAME="root"/' .env
sed -i 's/DB_PASSWORD=.*/DB_PASSWORD="yourawesomemysqlpassword"/' .env

sed -i 's/BROADCAST_DRIVER=.*/BROADCAST_DRIVER=reverb/' .env
sed -i 's/QUEUE_CONNECTION=.*/QUEUE_CONNECTION=redis/' .env
sed -i 's/REDIS_CLIENT=.*/REDIS_CLIENT=predis/' .env
sed -i 's/REDIS_HOST=.*/REDIS_HOST=redis/' .env
sed -i 's/REDIS_PASSWORD=.*/REDIS_PASSWORD=null/' .env
sed -i 's/REDIS_PORT=.*/REDIS_PORT=6379/' .env

sed -i 's/REVERB_APP_ID=.*/REVERB_APP_ID=123456/' .env
sed -i 's/REVERB_APP_KEY=.*/REVERB_APP_KEY=yourappkey/' .env
sed -i 's/REVERB_APP_SECRET=.*/REVERB_APP_SECRET=yourappsupersecret/' .env
sed -i 's/REVERB_SERVER_HOST=.*/REVERB_SERVER_HOST=0.0.0.0/' .env
sed -i 's/REVERB_SERVER_PORT=.*/REVERB_SERVER_PORT=8080/' .env
sed -i 's/REVERB_HOST=.*/REVERB_HOST=ws.yourawesomedomain.com/' .env
sed -i 's/REVERB_PORT=.*/REVERB_PORT=443/' .env
sed -i 's/REVERB_SCHEME=.*/REVERB_SCHEME=https/' .env

```