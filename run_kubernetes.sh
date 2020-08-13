#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
export dockerpath=javiercaparo/udacity-project-ml-microservice-docker-kubernetes:latest

# Step 2
# Run the Docker Hub container with kubernetes
sudo kubectl run ml-microservice --image=$dockerpath --port=80 --labels="app=ml-microservice"

# Step 3:
# List kubernetes pods
sleep 10; echo "PODs creation in progress..just some seconds to be in running state"
sleep 50; sudo kubectl get pods

# Step 4:
# Forward the container port to a host
sleep 5; echo "Forwarding the container port to a host"
export POD_NAME=$(sudo kubectl get pod -l app=ml-microservice -o jsonpath="{.items[0].metadata.name}")
sudo kubectl port-forward $POD_NAME 8000:80