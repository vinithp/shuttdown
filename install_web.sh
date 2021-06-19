#!/bin/bash
print_usage(){
    printf '%s\n' "INSTALL AND SETUP WEB"
    printf '\n %s\n %s\n %s\n\n%s\n' "-a: install and setup" "-i: install" "-s: setup" "usage: ./install_web.sh -a"
}

install(){
    cd
    sudo apt install tmux
    echo -e 'tmuxr(){\ntmux attach-session -t $1\n}' >> ~/.bashrc
    echo -e 'tmuxs(){\ntmux new -s $1\n}' >> ~/.bashrc
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:/usr/local/bin/' >> ~/.bashrc

    node --version || (curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash - && sudo apt-get install -y nodejs)
    go version || (wget https://dl.google.com/go/go1.16.5.linux-amd64.tar.gz && sudo tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz)
    source ~/.bashrc

    go get -u github.com/ffuf/ffuf
    git clone https://github.com/danielmiessler/SecLists.git
    sudo npm install -g pm2
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
    echo -e '\n add below content to /etc/nginx/sites-enabled/default\n proxy_pass http://localhost:5000;\nproxy_http_version 1.1;\nproxy_set_header Upgrade $http_upgrade;\nproxy_set_header Connection 'upgrade';\nproxy_set_header Host $host;\nproxy_cache_bypass $http_upgrade;\n real_ip_header X-Forwarded-For\n and add your domain name\n certbot --nginx -d shuttdown.tech -d www.shuttdown.tech\n certbot renew --dry-run'
    echo -e 'run sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com'
    echo -e '\n checkout this link if any problem == https://gist.github.com/bradtraversy/cd90d1ed3c462fe3bddd11bf8953a896 \n'
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
