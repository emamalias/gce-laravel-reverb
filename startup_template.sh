sudo su

cd ~

apt install curl -y
apt install git -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 18

# clone repo
git clone https://github.com/emamalias/gce-laravel-reverb.git laravel-web-socket

cd ~/laravel-web-socket

chmod +x startup_script.sh

./startup_script.sh
