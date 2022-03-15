#!/bin/bash

#INTERVAL=$1
echo "Configured to generate new fortune every $INTERVAL seconds"

trap "exit" SIGINT
mkdir /var/htdocs
while :
do
  echo $(date) Writing fortune to /var/htdocs/index.html
  /usr/games/fortune > /var/htdocs/index.html
  sleep $INTERVAL
done
