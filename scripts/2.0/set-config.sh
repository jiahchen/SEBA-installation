#!/bin/bash

TOSCA_IP="127.0.0.1"
TOSCA_PORT=30007

curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/2.0/fabric.yml http://$TOSCA_IP:$TOSCA_PORT/run
sleep 20
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/2.0/whitelist.yml http://$TOSCA_IP:$TOSCA_PORT/run
sleep 20
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/2.0/techProfile.yml http://$TOSCA_IP:$TOSCA_PORT/run
sleep 20
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/2.0/subscriber.yml http://$TOSCA_IP:$TOSCA_PORT/run
sleep 20
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/2.0/openolt.yml http://$TOSCA_IP:$TOSCA_PORT/run
