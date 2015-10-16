#!/bin/bash

# start the database
printf "[*] Starting Postgres and MSF\n"
printf "[*] Pardon the delay...\n"
service postgresql start &

#wait for service to start, then start msfconsole
while true;do
    if pgrep postgres > /dev/null;
    then
        sleep 7
        msfconsole
        break
    fi
done
exit
