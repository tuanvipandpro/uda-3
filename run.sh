#!/bin/sh

# source ./set_env.sh
# echo $POSTGRES_USERNAME
# echo $POSTGRES_PASSWORD
# echo $POSTGRES_HOST
# echo $POSTGRES_DB
# echo $AWS_BUCKET
# echo $AWS_REGION
# echo $AWS_PROFILE
# echo $JWT_SECRET

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker image prune --all
docker-compose -f docker-compose-build.yaml build --parallel --no-cache
docker-compose up

# kubectl apply -f backend-user-deployment.yaml
# kubectl apply -f backend-feed-deployment.yaml
# kubectl apply -f frontend-deployment.yaml
# kubectl apply -f reverseproxy-deployment.yaml