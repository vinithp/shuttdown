#!/bin/bash

setup(){

	cd
	mkdir ~/tools
	mkdir ~/tools/my
	mkdir ~/tools/my/rcfile
	cp ~/.bashrc ~/tools/rcfile/bashrc
	cp ~/.vimrc ~/tools/rcfile/vimrc
	echo -e 'export PATH=$PATH:/usr/local/go/bin' >> ~/tools/rcfile/bashrc
	echo -e 'export PATH=$PATH:~/.local/go/bin' >> ~/tools/rcfile/bashrc
	echo -e 'export PATH=$PATH:~/.local/bin' >> ~/tools/rcfile/bashrc


}

install(){
	
	sudo apt install whois
	sudo apt install amass
	sudo apt install jq
	sudo apt install python2
	sudo apt install python3
	sudo apt install python3-pip
	curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
	sudo python2 get-pip.py
	rm get-pip.py
	pip3 install typer
	pip2 install py-altdns
	GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
	go get -u github.com/tomnomnom/assetfinder
	
	cd ~/tools
	git clone https://github.com/gwen001/github-search.git
	git clone https://github.com/blechschmidt/massdns.git
	cd ~/tools/massdns
	make
	cp ~/tools/massdns/bin/massdns ~/.local/bin/ 
}

rcfileup(){

	cat ~/tools/rcfile/bashrc >> ~/tools/rcfile/bashrc2
	cat ~/backup/rcfile/bashrc >> ~/tools/rcfile/bashrc2
	cp ~/tools/rcfile/bashrc2 ~/.bashrc

	cat ~/tools/rcfile/vimrc >> ~/tools/rcfile/vimrc2
	cat ~/backup/rcfile/vimrc >> ~/tools/rcfile/vimrc2
	cp ~/tools/rcfile/vimrc2 ~/.vimrc
}

$1
