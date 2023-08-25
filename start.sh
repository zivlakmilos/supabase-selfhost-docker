#!/usr/bin/env bash

# 8000 -> Http Port
# 8443 -> Https Port
# 3000 -> Studio Port

project=$1

docker run --privileged --name $project-docker -d \
	--network $project-network --network-alias docker \
	-e DOCKER_TLS_CERTDIR=/certs \
	-v $project-docker-certs-ca:/certs/ca \
	-v $project-docker-certs-client:/certs/client \
	-p 127.0.0.1:8000:8000 \
	-p 127.0.0.1:8443:8443 \
	-p 127.0.0.1:3000:3000 \
	-v ./supabase:/supabase \
	docker:24-dind

docker run --rm -d --name $project-docker-front \
	--network $project-network \
	-e DOCKER_TLS_CERTDIR=/certs \
	-v $project-docker-certs-client:/certs/client:ro \
	-v ./supabase:/supabase \
	-w /supabase/docker \
	docker:24 docker-compose up
