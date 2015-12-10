FROM officialkali/kali
MAINTAINER awhitehttr@gmail.com

ENV DEBIAN_FRONTEND noninteractive

#We install msf here as a dirty way to get the db going
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get clean
RUN apt-get -y install curl postgresql metasploit-framework

#Setup the Database
RUN ["service","postgresql","start"]
RUN msfdb init

#Install Nightly builds
RUN apt-get -y remove metasploit-framework
RUN /usr/bin/curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
RUN chmod 755 msfinstall
RUN /msfinstall

# This shell script starts the postgresl service,
#   waits for it to start then starts msfconsole
COPY init.sh init.sh
RUN chmod 755 init.sh

CMD ["/bin/bash", "-c", "./init.sh"]
