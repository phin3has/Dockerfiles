#!/bin/bash

#start the DNS Service
dnsmasq -C /opt/dhcp.conf

#now start hostapd.
hostapd -s /conf/hostapd.conf
