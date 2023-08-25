#!/usr/bin/env bash

project=$1

docker container stop $project-docker-front
docker container stop $project-docker

docker container rm $project-docker-front
docker container rm $project-docker
