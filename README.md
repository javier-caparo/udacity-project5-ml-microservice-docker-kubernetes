# udacity-project5-ml-microservice-docker-kubernetes
The goal is to operationalize a machine learning microservice written in python  using docker &amp; kubernetes.

[![CircleCI](https://circleci.com/gh/circleci/circleci-docs.svg?style=svg)](https://app.circleci.com/pipelines/github/jfcb853/udacity-project5-ml-microservice-docker-kubernetes)

## Project Overview

here you will find the steps and requirements to operationalize the machine learning python microservice used in Udacity's DevOps Cloud Nanodegree Project # 5. More information about the project can be found in the original [github repository](https://hub.docker.com/r/javiercaparo/udacity-project-ml-microservice-kubernetes).

The microservice is build as a python app and the repository includes the necessary files to build and run the app in a docker container, push the docker image to docker hub , and use that image in a minikube Kubernetes deployment .

## What development tools or IDE were used in this project

* AWS CLoud9 as IDE and to use docker in his EC2 VM created.
* GCP VM as Kubernetes minikube host

### Project files

This is the file structure of this repository. More detail of each one of these files in the below sections.

| Filename | Description |
| ------ | ------ |
| app.py | the app written in python using flask exposing an api to perform a house renting prediction based on certain parameters |
| Dockerfile | used to build the docker image |
| gcp-minikube-steps.txt | How to install minikube in GCP VM |
| LICENSE | license file |
| make_prediction.sh | script to perform the posts to the api app |
| Makefile |  |
| model_data| Directory of csv data and ml model to perform the predictions |
|    boston_housing_prediction.joblib | model trained before |
|    housing.csv | csv data  |
| output_txt_files | Directory of results  |
|    docker_out.txt | output of run predictions on docker container   |
|    kubernetes_out.txt | output of run predictions on kubernetes pods in minikube  |
|    kubernetes-scaling-results.txt | results of K8s scale up and down |
| prediction_1.json | json data for the 1st request |
| prediction_2.json | json data for the 2do request |
| README.md | this README.md file |
| requirements.txt|  dependencies used in the app and to perform the lint|
| run_docker.sh | script to build the docker image and run it locally |
| run_kubernetes.sh | script to depploy the containerized app in kubernetes minikube |
| upload_docker.sh| script to push the docker image to docker hub |
| .circleci| directory to use circleci for CI/CD|
|     config.yml | circleci config yaml file to check dependencies and lint in CircleCI to perform CI/CD|


### The app app.py

_app.py_ --> It's the api microservice wirtten in python , using flask. It uses the data in the files under _model_data_ folder to be able to provide the prediction as an api
_make_prediction.sh_  --> The auxiliary file _make_prediction.sh_ allows us to test the app easily using curl calling 2 predefined json files.
_prediction_1.json_ & _prediction_2.json_ --> entrance parameters in json format to obtain the predictions.

### The docker container

The Dockerfile to build the container is provided, but you can also download the latest version of the container from [my docker hub](https://hub.docker.com/r/javiercaparo/udacity-project-ml-microservice-kubernetes). 

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
* Install docker ( recommendation: use AWS Cloud9 since docker comes by default on the EC2 created by this service)
* Install kubernetes. Additionally to run kubernetes locally you have to install Minikube which allows you to run a single-node Kubernetes cluster inside a local VM.

### Setting up the environment

* Use the _Makefile_ with instructions on environment setup and lint tests

* To set up the  python virtual environment:  installing python dependencies just run the following commands

```bash
python3 -m venv ~/.devops
source ~/.devops/bin/activate
```
* To install python dependencies just run :
```bash
make install
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
2. Docker issues
if docker build fails with: 
Error processing tar file(exit status 1): write /usr/local/lib/python3.7/site-packages/scipy/misc/face.dat: no space left on device

fix:
```bash
docker system df
```
check if RECLAIMABLE amount is greater than zero (that would definitely the case) then run command
```bash
docker system prune -a
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)

License
----

MIT

**Free Software, Hell Yeah!**
