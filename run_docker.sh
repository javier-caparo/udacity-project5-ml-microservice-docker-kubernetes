#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
sudo docker build -t javiercaparo/udacity-project-ml-microservice-docker-kubernetes .

# Step 2: 
# List docker images
sudo docker image ls

# Step 3: 
# Run flask app
sudo docker run -d --name ml-microservice -p 8000:80 udacity-project-ml-microservice-docker-kubernetes