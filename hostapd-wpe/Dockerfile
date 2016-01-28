#################################################
# Hostpadapd-WPE Edition w/Radius Backend
# Thanks https://github.com/fgg89
#################################################

FROM phusion/baseimage:0.9.18

MAINTAINER awhitehatter

RUN apt-get update -y

#Install prerequisites
RUN apt-get install -y \  
	dnsmasq \ 
	patch \ 
	make \ 
	gcc \
	libssl-dev \ 
	libnl-dev 

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

#Install HOSTAPD-WPE
ADD tools/hostapd-2.2.tar.gz /opt/
ADD tools/hostapd-wpe.tar.gz /opt/
RUN cd /opt/ && patch -p0 < ./hostapd-wpe/hostapd-wpe.patch
RUN cd /opt/hostapd-2.2/hostapd/ && make
RUN cd /opt/hostapd-wpe/certs/ && ./bootstrap

#create symbolic link and working directory to dump logs in
RUN ln -s /opt/hostapd-2.2/hostapd/hostapd-wpe /usr/sbin/hostapd
RUN mkdir workingdir
