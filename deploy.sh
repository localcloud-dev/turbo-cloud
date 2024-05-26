#!/bin/sh

#Parameters
#$1 - public ip address of a server
#$2 - domain
#Example: ./deploy.sh 12.32.22.43 myproject.com

scp -r "${PWD}"/ root@$1:/root/website

ssh root@$1 domain=$2 'bash -s' <<'ENDSSH'

    sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
    sudo apt update
    sudo apt install caddy

    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    sudo echo -e "FROM joseluisq/static-web-server:2-alpine\nCOPY ./ public/" >> /root/website/Dockerfile
    sudo docker build /root/website/ -t static_img
    sudo docker run -it -d --restart unless-stopped -p 8787:80 static_img

    rm /etc/caddy/Caddyfile
    sudo echo -e "$domain {\nreverse_proxy * localhost:8787\n}" >> /etc/caddy/Caddyfile
    caddy reload -c /etc/caddy/Caddyfile

ENDSSH
