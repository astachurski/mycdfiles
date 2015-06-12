#!/bin/sh

#STAGE: COMPILE MONGOOSE
#DESCR: compile mongooseim otp application from sources
#NEXT STAGES POSSIBLE: functional testing, UAT, staging, production depl.

sudo apt-get install -y -q git

cd /usr

sudo git clone https://github.com/astachurski/MongooseIM.git

sudo make

sudo make rel

cd MongooseIM/rel/mongooseim/bin/

sudo ./mongooseimctl start

