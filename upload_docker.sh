#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
export dockerpath=javiercaparo/udacity-project-ml-microservice-docker-kubernetes:latest

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"
sudo docker login --username=javiercaparo
sudo docker tag javiercaparo/udacity-project-ml-microservice-docker-kubernetes $dockerpath

# Step 3:
# Push image to a docker repository
sudo docker push $dockerpath
