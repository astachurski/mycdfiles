#!/bin/sh

#DEPLOY GO-AGENT and prepare environment for MongooseIM build and unit testing

#TODO: pass as parameter from Vagrantfile via main deploy script.
#when NAT is used - this is NOT the HOST IP !!! list the interfaces on host and
#use ip of one of the virtual network devices that connects to virtual instance.
GO_CD_SERVER_IP="192.168.33.1"

BASE_FILE_PATH=/vagrant/files
JAVA_VERSION=7u80-linux-i586
JAVAFILE=${BASE_FILE_PATH}/jre-${JAVA_VERSION}.tar.gz

sudo apt-get update
sudo apt-get install -y -q unzip
sudo apt-get install -y -q ntp

if [ ! "`which java`" = '/usr/bin/java' ]; then
    sudo apt-get install -y -q openjdk-7-jre-headless
fi

#todo: install ntp server!
sudo apt-get install -y -q libpam0g-dev
sudo apt-get install -y -q libexpat1-dev
sudo apt-get install -y -q odbc-postgresql
sudo apt-get install -y -q libmyodbc
sudo apt-get install -y -q git
sudo apt-get install -y -q emacs23-nox
sudo apt-get install -y -q tmux

#This can be called from outside, AFTER this script.
#todo: parametrize by OTP version for possibly parallel multiplatform tests.
#/vagrant/shells/deploy-otp.sh   MOVED OUTSIDE!

GO_AGENT_VERSION=15.1.0-1863
AGENTFILE=${BASE_FILE_PATH}/go-agent-${GO_AGENT_VERSION}.deb

#the impicit scripts will create go:go user and start the worker afterwards.
if [ -e "$AGENTFILE" ]; then
    sudo dpkg -i $AGENTFILE
fi

#ensure environment also works for user logging into worker machine
sudo cp /etc/skel/.bashrc /var/go/
sudo chown go:go /var/go/.bashrc
sudo echo "export HOME=/var/go" >> /var/go/.bashrc

sudo echo "export PATH=$PATH:/usr/${OTP_VERSION_NAME}" >> /etc/default/go-agent
sudo echo "export PATH=$PATH:/usr/${OTP_VERSION_NAME}/bin" >> /etc/default/go-agent
sudo echo "export HOME=/var/go" >> /etc/default/go-agent
sudo sed -i "s/127.0.0.1/${GO_CD_SERVER_IP}/g" /etc/default/go-agent

sudo service go-agent restart

