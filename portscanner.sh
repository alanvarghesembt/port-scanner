#!/bin/bash

IP=$1
START_PORT=$2
END_PORT=$3

echo "Scanning $IP from port $START_PORT to $END_PORT"

for (( port=$START_PORT; port<=$END_PORT; port++ ))
do
    timeout 1 bash -c "</dev/tcp/$IP/$port" &>/dev/null
    if [ $? -eq 0 ]; then
        echo "Port $port is OPEN"
    else
        echo "Port $port is CLOSED"
    fi
done
