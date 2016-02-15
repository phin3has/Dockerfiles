FROM awhitehatter/hostapd-wpe

MAINTAINER awhitehatter

COPY scripts/init.sh init.sh
COPY conf/dhcp.conf /opt/dhcp.conf
RUN chmod 755 init.sh

CMD ["/bin/bash", "-c", "./init.sh"]


