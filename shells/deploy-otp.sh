#!/bin/sh

#STAGE: INSTALL OTP
#DESCR: download, build and install Erlang OTP platform
#NEXT STAGES POSSIBLE: run, compile, eunit, ctests...

#todo: parametrize with OTP version.

OTP_VERSION="17.4"
OTP_VERSION_NAME="OTP_174"
sudo apt-get install -y -q make
sudo apt-get install -y -q curl
curl -O -s https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
chmod a+x kerl
sudo cp kerl /usr/bin
sudo kerl update releases
sudo kerl build ${OTP_VERSION} ${OTP_VERSION_NAME}
sudo kerl install ${OTP_VERSION_NAME} /usr/${OTP_VERSION_NAME}

#this will setup OTP for provisioning user, e.g vagrant
#it may be safely deleted as reduntant. Settings for logging
#worker user in interactive mode are in worker provisioning script.
echo "export PATH=$PATH:/usr/${OTP_VERSION_NAME}" >> .bashrc
echo ". /usr/${OTP_VERSION_NAME}/activate" >> .bashrc
echo "export PATH=$PATH:/usr/${OTP_VERSION_NAME}/bin" >> .bashrc




