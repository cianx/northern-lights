#!/bin/bash
STARTTIME=$(date +%s)

apt-get update
apt-get upgrade
apt-get install -y build-essentials python3

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

npm install -g cordova
npm install -g gulp

CMD="source /home/vagrant/vagrant/bashrc"
if ! grep -Fxq "$CMD" /home/vagrant/.bashrc; then
    echo $CMD >> /home/vagrant/.bashrc
fi

config.vm.synced_folder "..", "/project"


ENDTIME=$(date +%s)
echo "Provisioned in $(($ENDTIME - $STARTTIME))S"
