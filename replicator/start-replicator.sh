#!/bin/bash

replicator_key='<PRIVATE_KEY>'

docker stop replicator
docker rm replicator
docker run -d --name replicator --network host -v $PWD:/root/.dfms-replicator:rw proximax/dfms-replicator:v0.8.0 dfms-replicator -k $replicator_key
docker exec replicator dfms-replicator contract accepting
