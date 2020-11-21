#!/bin/bash

director_key='<PRIVATE_KEY>'

docker stop director
docker rm director
docker run -d --name director -p 6366:6366 -p 63666:63666 -v $PWD:/root/.dfms-client:rw proximax/dfms-client:v0.8.0 dfms-client -k $director_key
