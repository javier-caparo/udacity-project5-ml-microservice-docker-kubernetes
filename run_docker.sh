#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
sudo docker build -t ml-microservice .

# Step 2: 
# List docker images
sudo docker image ls

# Step 3: 
# Run flask app
sudo docker run -it --name ml-microservice -p 8000:80 ml-microservice
#sudo docker run -d --name ml-microservice -p 8000:80 ml-microservice

# Step 4: 
# Verify that container is running
sudo docker ps