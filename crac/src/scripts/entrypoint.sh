#!/bin/bash

java -XX:CRaCCheckpointTo=/crac -jar /app/app.jar &
#sleep 10
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' localhost:8080/actuator/health/readiness)" != "200" ]]; do sleep 5; done
sleep 10
jcmd /app/app.jar JDK.checkpoint
echo "snapshot taken"