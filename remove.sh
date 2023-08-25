#!/usr/bin/env bash

project=$1

docker container rm $project-docker

docker network rm $project-network
docker volume rm $project-docker-certs-ca
docker volume rm $project-docker-certs-client
