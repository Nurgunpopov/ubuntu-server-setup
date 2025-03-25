# обновим пакеты и репозитории
sudo apt-get update
sudo apt-get upgrade -y

# установим curl
sudo apt-get install curl -y

# установим node.js
sudo apt-get install -y ca-certificates gnupg
curl -fsSl https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
MODE_MAJOR=18
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources
sudo apt-get update && sudo apt-get install nodejs -y

# установим nginx
sudo apt-get install nginx -y

# установим certbot
sudo apt-get install python3-certbot-nginx -y

# установим docker
sudo apt-get install apt-transport-https lsb-release -y
curl -fsSl https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amdb4 signed-by:/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# добавим текущего пользователя в группу докер
sudo usermod -aG docker $USER
