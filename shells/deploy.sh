#!/bin/sh

HOSTNAME=`hostname -s`

if [ "$HOSTNAME" = "go-cd-server" ]; then
    sh /vagrant/shells/go-server-deploy.sh
elif [ "$HOSTNAME" = "go-cd-agent-build" ]; then
    #deploy otp platform for building
    . /vagrant/shells/deploy-otp.sh
    #deploy go-agent with prerequisities    
    . /vagrant/shells/go-cd-agent-build-deploy.sh
elif [ "$HOSTNAME" = "go-cd-agent-functesting" ]; then
    cd .
    # sh /vagrant/shells/go-agent2-deploy.sh
fi
