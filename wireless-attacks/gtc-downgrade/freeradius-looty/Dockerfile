FROM ubuntu:12.04
MAINTAINER awhitehatter

#Update Packages
RUN apt-get update -y 

#Install required packages for build
RUN apt-get install -y make \
	gcc \
	patch \
	libfreeradius2 \
	libfreeradius-dev \
	libssl-dev \
	openssl

#Install FreeRadius and Patch
ADD tools/freeradius-server-2.1.12.tar.gz /opt/
ADD tools/PuNk1n.patch /opt/
RUN cd /opt/freeradius-server-2.1.12/ && patch -p1 < ../PuNk1n.patch
RUN cd /opt/freeradius-server-2.1.12/ && ./configure && make && make install
RUN ldconfig

#Add our custom config files for the attack
ADD conf/eap.conf /usr/local/etc/raddb/eap.conf
ADD conf/clients.conf /usr/local/etc/raddb/clients.conf
RUN chmod 640 /usr/local/etc/raddb/clients.conf
RUN chmod 640 /usr/local/etc/raddb/eap.conf
