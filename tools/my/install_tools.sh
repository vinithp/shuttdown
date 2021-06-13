#!/bin/bash

setup(){
    cd
    mkdir ~/tools
    mkdir ~/tools/my
    mkdir ~/.config/amass/jk/
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc 
    echo 'export PATH=$PATH:/usr/local/bin/' >> ~/.bashrc

    cp ~/tools/my/rcfile/vimrc ~/.vimrc
    cp ~/tools/my/config/config.ini ~/.config/amass/jk/
}

install(){
    sudo apt update
    sudo apt install whois
    sudo apt install amass
    sudo apt install jq
    sudo apt install python2
    sudo apt install python3
    sudo apt install python3-pip
    curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
    sudo python2 get-pip.py
    rm get-pip.py

    go version || wget https://dl.google.com/go/go1.16.5.linux-amd64.tar.gz; rm -rf /usr/local/go; tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz
    node --version || curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -; sudo apt-get install -y nodejs

    pip3 install typer
    pip2 install py-altdns
    GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
    go get -u github.com/tomnomnom/assetfinder
    go get -u github.com/tomnomnom/httprobe
    GO111MODULE=on go get -u -v github.com/lc/gau
    go get github.com/tomnomnom/waybackurls
    go get -u github.com/jaeles-project/gospider

    cd ~/tools
    git clone https://github.com/gwen001/github-search.git
    git clone https://github.com/blechschmidt/massdns.git
    cd ~/tools/massdns
    make
    cp ~/tools/massdns/bin/massdns ~/.local/bin/
}

[ $1 == '' ] && echo -e "missing flags\nflags :(all, setup, install)"
[ $1 == 'all' ] && setup; install
[ $1 == 'setup' ] && setup
[ $1 == 'install' ] && install
                                                                                                                                        68,33       
