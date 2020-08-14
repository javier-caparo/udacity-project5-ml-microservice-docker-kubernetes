#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
export dockerpath=javiercaparo/udacity-project-ml-microservice-kubernetes:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice --image=$dockerpath --port=80 --labels="app=ml-microservice"


# Step 3:
# List kubernetes pods
sleep 10; echo "PODs creation in progress..just some seconds to be in running state"
sleep 50; kubectl get pods

# Step 4:
# Forward the container port to a host
sleep 5; echo "Forwarding the container port to a host"
export POD_NAME=$(kubectl get pod -l app=ml-microservice -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8000:80

# Another way : creating a deployment to perform scale up/down with pods
#kubectl create deployment ml-microservice --image=$dockerpath 
#Step 5:
# Scaling up & down
# - Scale up:
# kubectl scale --current-replicas=1 --replicas=3 deployment/ml-microservice
#  kubectl get pod
#
# - Scale down:
# kubectl scale --current-replicas=3 --replicas=2 deployment/ml-microservice
#  kubectl get pod