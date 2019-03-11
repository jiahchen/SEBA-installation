#!/bin/bash

TOSCA_IP="127.0.0.1"
TOSCA_PORT=30007

curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/fabric.yml http://$TOSCA_IP:$TOSCA_PORT/run
sleep 60
#curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/openolt.yml http://$TOSCA_IP:$TOSCA_PORT/run
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/subscriber.yml http://$TOSCA_IP:$TOSCA_PORT/run
sleep 60
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./pod-config/openolt.yml http://$TOSCA_IP:$TOSCA_PORT/run
