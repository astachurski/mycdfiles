#!/bin/sh

BASE_FILE_PATH=/vagrant/files
JAVA_VERSION=7u80-linux-i586
JAVAFILE=${BASE_FILE_PATH}/jre-${JAVA_VERSION}.tar.gz
sudo apt-get update
sudo apt-get install -y -q unzip
sudo apt-get install -y -q openjdk-7-jre-headless

#if [ -e $JAVAFILE ]; then
#    echo "ok, ${JAVAFILE} exists"
#    tar -xzf ${JAVAFILE} -C /opt
#    sudo  update-alternatives --install /usr/bin/java java /opt/jre1.7.0_80/bin/java 100
#fi

GO_SERVER_VERSION=15.1.0-1863
SERVERFILE=${BASE_FILE_PATH}/go-server-${GO_SERVER_VERSION}.deb

GO_AGENT_VERSION=15.1.0-1863
AGENTFILE=${BASE_FILE_PATH}/go-agent-${GO_AGENT_VERSION}.deb

#if [ -e $SERVERFILE ]; then
#    echo "ok, $SERVERFILE exists"
#    sudo dpkg -i ${SERVERFILE}
#fi

if [ -e "$AGENTFILE" ]; then
    sudo dpkg -i $AGENTFILE
fi
