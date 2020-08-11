#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
export dockerpath=javiercaparo/udacity-project-ml-microservice-docker-kubernetes

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run ml-microservice --image=$dockerpath --port=80 --labels="app=ml-microservice"

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
export POD_NAME=$(kubectl get pod -l app=ml-microservice -o jsonpath="{.items[0].metadata.name}")
kubectl port-forward $POD_NAME 8000:8000