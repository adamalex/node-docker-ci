FROM        ubuntu:14.04

MAINTAINER  Adam Alexander <adamalex@gmail.com>

# INSTALL OS DEPENDENCIES AND NODE.JS
ENV         DEBIAN_FRONTEND noninteractive
RUN         apt-get update; apt-get install -y software-properties-common g++ make
RUN         add-apt-repository -y ppa:chris-lea/node.js
RUN         apt-get update; apt-get install -y nodejs=0.10.29-1chl1~trusty1

# COMMIT PROJECT FILES
ADD         package.json /root/
ADD         test.js /root/
ADD         app.js /root/

# INSTALL PROJECT DEPENDENCIES
RUN         cd /root; npm install

# TEST THE PROJECT -- FAILURE WILL HALT IMAGE CREATION
RUN         cd /root; npm test

# TESTS PASSED -- CONFIGURE IMAGE
WORKDIR     /root
ENTRYPOINT  ["/usr/bin/npm"]
CMD         ["start"]
EXPOSE      8080
