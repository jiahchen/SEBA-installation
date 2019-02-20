#!/bin/bash

TOSCA_IP="127.0.0.1"
TOSCA_PORT=30007

curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./fabric.yml http://$TOSCA_IP:$TOSCA_PORT/delete
curl -H "xos-username: admin@opencord.org" -H "xos-password: letmein" -X POST --data-binary @./openolt.yml http://$TOSCA_IP:$TOSCA_PORT/delete
