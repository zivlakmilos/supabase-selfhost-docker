#!/usr/bin/env bash

project=$1

docker network create $project-network
docker volume create $project-docker-certs-ca
docker volume create $project-docker-certs-client

git clone --depth 1 https://github.com/supabase/supabase
cp supabase/docker/.env.example supabase/docker/.env
