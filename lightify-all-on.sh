#!/bin/bash
# You need to install ja to parse the json returned with the auth token
# API reference: https://us.lightify-api.org/lightify/
Authtoken=$(curl -s -H 'Content-Type: application/json' -X POST -d '{"username" : "LIGHTIFY ACCOUNT EMAIL", "password" : "PLACEHOLDER", "serialNumber" : "OSR0XXXXXX"}' https://us.lightify-api.org/lightify/services/session | jq ."securityToken" | sed 's/\"//g')

curl -s -H 'Content-Type: application/json' -H "authorization:$Authtoken" -X GET  https://us.lightify-api.org/lightify/services/device/all/set?onoff=1

#logout/destroy Authtoken
curl -s -H 'Content-Type: application/json' -H "authorization:$Authtoken" -X DELETE  https://us.lightify-api.org/lightify/services/session

exit 0
