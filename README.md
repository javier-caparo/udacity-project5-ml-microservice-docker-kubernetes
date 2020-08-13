# udacity-project5-ml-microservice-docker-kubernetes
The goal is to operationalize a machine learning microservice written in python  using docker &amp; kubernetes.

[![CircleCI](https://circleci.com/gh/circleci/circleci-docs.svg?style=svg)](https://app.circleci.com/pipelines/github/jfcb853/udacity-project5-ml-microservice-docker-kubernetes)

## Project Overview

here you will find the steps and requirements to operationalize the machine learning python microservice used in Udacity's DevOps Cloud Nanodegree Project # 5. More information about the project can be found in the original [github repository](https://github.com/udacity/DevOps_Microservices/tree/master/project-ml-microservice-kubernetes).

The microservice is build as a python app and the repository includes the necessary files to run build and run the app in a docker container, push the docker image to docker hub , and use that image in a minikube Kubernetes deployment .

### Project files

This is the file structure of this repository. More detail of each one of these files in the below sections.

├── app.py  
├── Dockerfile
├── gcp-minikube-steps.txt
├── LICENSE
├── make_prediction.sh 
├── Makefile 
├── model_data  
│   ├── boston_housing_prediction.joblib
|   └──  housing.csv
├── output_txt_files  
│   ├── docker_out.txt
|   ├── kubernetes_out.txt
│   └── kubernetes-scaling-results.txt  
├── prediction_1.json 
├── prediction_1.json 
├── README.md  
├── requirements.txt  
├── run_docker.sh  
├── run_kubernetes.sh  
└── upload_docker.sh  

### The app app.py

_app.py_ --> It's the api microservice wirtten in python , using flask. It uses the data in the files under _model_data_ folder to be able to provide the prediction as an api
_make_prediction.sh_  --> The auxiliary file _make_prediction.sh_ allows us to test the app easily using curl calling 2 predefined json files.
_prediction_1.json_ & _prediction_2.json_ --> entrance parameters in json format to obtain the predictions.

### The docker container

The Dockerfile to build the container is provided, but you can also download the latest version of the container from [my docker hub](insert here link on docker hub). 

To build your container locally if you prefer you get these files
* run_docker.sh: builds and runs the docker container with the app
* upload_docker.sh: tags and pushes the container to docker hub. 

### The Kubernetes (k8s) using minikube in GCP VM

* You can deploy the containerized already app on any Kubernetes platform, but here I've included  how to deploy minikube in a GCP VM:
_gcp-minikube-steps.txt_ --> How to install minikube on GCP VM engine

* To deploy the docker container on Kubernet minikube execute this file:
_run_kubernetes.sh_: runs the container in kubernetes and forwards the container port 80 to host port 8000

## Building and running the app

### Prerequisites

* Install _hadolint_ following the instructions [here](https://github.com/hadolint/hadolint) or the easy way:
```bash
wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.18.0/hadolint-Linux-x86_64
chmod +x /bin/hadolint
``` 
* Install docker
* Install kubernetes. Additionally to run kubernetes locally you have to install Minikube which allows you to run a single-node Kubernetes cluster inside a local VM.

### Setting up the environment

* Use the _Makefile_ with instructions on environment setup and lint tests

* To set up the  python virtual environment:  installing python dependencies just run the following commands

```bash
$> make setup
$> source ~/.devops/bin/activate
```
* To install python dependencies just run :
```bash
$> make install
```
### Lint tests
* To perform the lint tests , execute ``` make link ```to pass hadolint on the Dockerfile and pylint on the python file app.py

``` bash
$> make lint
```

### Running the application

* Standalone: 
    ```bash
    $> python app.py
    ```
* Run in Docker: 
    ```bash
    $> ./run_docker.sh
    ```
* Run in Kubernetes: 
    ```bash
    $> ./run_kubernetes.sh
    ```

## How some issues were fixed:

1. Linting  the app.py failed with error " W1309: Using an f-string that does not have any interpolated variables (f-string-without-interpolation)" 
*  Fix :  line with error --> 	```html = f"<h3>Sklearn Prediction Home </h3>"``` ; was changed to:
```
            title = "Sklearn Prediction Home"
			html = f"<h3>{title}</h3>"
```

