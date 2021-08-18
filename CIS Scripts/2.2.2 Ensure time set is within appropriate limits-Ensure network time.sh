#!/bin/bash

# Get Time Server

timeserver=$(systemsetup -getnetworktimeserver | sed -n -e 's/^.*\(Server: \)//p')
echo "$timeserver"

touch /var/db/ntp-kod
chown root:wheel /var/db/ntp-kod
sudo sntp -sS "$timeserver"
exit 0
