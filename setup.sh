#!/bin/bash
mkdir temp
mkdir work

sudo apt install -y git etherwake ncdu byobu mc screen vim htop wget git net-tools lynx smartmontools apt-transport-https \
ca-certificates curl software-properties-common autoconf autoconf-archive \
autogen automake python-pymongo python-yaml uuid-dev lm-sensors speedtest-cli \
 cmake 
sudo sensors-detect
bash <(curl -Ss https://my-netdata.io/kickstart.sh) --dont-wait

sudo sh -c "echo \"kernel.sysrq = 1\" >> /etc/sysctl.d/99-sysctl.conf"

#only rpi

#cd ~/temp/
#curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh ./get-docker.sh
#sudo apt install -y libffi-dev python python-pip
## best way to get the latest compose for rpi
#sudo pip install docker-compose
#sudo usermod -aG docker pi

#only gui systems

sudo snap install phpstorm --classic
sudo snap install spotify
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
cd ~/temp/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb 
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -y vlc openssh-server docker-ce gimp network-manager-openvpn-gnome docker-compose 
sudo apt update
sudo usermod -aG docker meltir
gsettings set org.gnome.shell.app-switcher current-workspace-only true

sudo apt upgrade -y


### ubuntu vms
# resize disk to full size

sudo growpart /dev/vda 3
sudo lvextend --resizefs -l +100%FREE ubuntu-vg/ubuntu-lv
sudo resize2fs /dev/ubuntu-vg/ubuntu-lv

