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

# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker image prune --all
# docker-compose -f docker-compose-build.yaml build --parallel --no-cache
# docker-compose up

kubectl apply -f backend-user-deployment.yaml
kubectl apply -f backend-feed-deployment.yaml
kubectl apply -f frontend-deployment.yaml
kubectl apply -f reverseproxy-deployment.yaml
kubectl apply -f backend-user-autoscaling.yaml
kubectl apply -f backend-feed-autoscaling.yaml
kubectl apply -f frontend-autoscaling.yaml
kubectl apply -f reverseproxy-autoscaling.yaml

# kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend
# kubectl expose deployment udagram-reverseproxy --type=LoadBalancer --name=publicreverseproxy

# kubectl autoscale deployment udagram-reverseproxy --cpu-percent=70 --min=1 --max=3

# kubectl get deployments
# kubectl get services 
# kubectl get pods