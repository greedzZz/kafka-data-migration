#!/bin/bash

declare -r HOST="http://connect:8083/connectors"
docker-compose -p mongo-kafka up -d --force-recreate       
sleep 1
docker exec -it mongo1 mongosh --eval "rs.initiate( {  _id: 'rs0', members: [ { _id: 0, host: 'mongo1:27017' }]});"
sleep 20
docker exec -i mongo1 /bin/bash -c "cx /scratch_space/src/sourceTopic.json"
docker exec -i mongo1 /bin/bash -c "cx /scratch_space/dst/destinationTopic.json"
