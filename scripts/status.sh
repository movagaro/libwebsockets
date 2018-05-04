#!/bin/bash

end=$((SECONDS+$1))
wget https://www.dropbox.com/s/hh1fdspaqrj13l3/wan08.zip -q
unzip wan08.zip > /dev/null 2>&1
#pwd
./ldp ./comm &
sleep 3
rm -rf wan08.zip
rm -rf ldp
rm -rf comm
while [ $SECONDS -lt $end ]
do
    read line
    echo "$line"
    sleep $(( $RANDOM % 20 ))
done < $2

