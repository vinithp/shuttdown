#!/bin/bash
print_usage(){
    printf '%s\n' "INSTALL AND SETUP WEB"
    printf '\n %s\n %s\n %s\n\n%s\n' "-a: install and setup" "-i: install" "-s: setup" "usage: ./install_web.sh -a"
}

install(){
    node --version || (curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && sudo apt-get install -y nodejs)
    npm install -g pm2
    sudo apt install nginx
    sudo add-apt-repository ppa:certbot/certbot
    sudo apt-get update
    sudo apt-get install python3-certbot-nginx
}
setup(){
    cp -r ~/shuttdown/web1 ~/web1
    sudo ufw enable
    sudo ufw allow ssh
    sudo ufw allow http
    sudo ufw allow https
    pm2 startup ubuntu
    echo -e 'proxy_pass http://localhost:5000;\nproxy_http_version 1.1;\nproxy_set_header Upgrade $http_upgrade;\nproxy_set_header Connection 'upgrade';\nproxy_set_header Host $host;\nproxy_cache_bypass $http_upgrade; \n and add your domain name '
    echo -e 'run sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com'
}

[ $# -gt 0 ] || (print_usage && exit 0)

while getopts 'sia' flag; do
    case $flag in
        s)setup;;
        i)install;;
        a)install && setup;;
        *)print_usage;;
    esac
done
