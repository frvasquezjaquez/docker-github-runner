# Github Runner Dockerfile

 Description

This dockerfile is used tu create a docker container with the docker runner so we can use it as a node for github actions. 

# Image Modification
This image has only the github runner installed, depending of the tasks that you want to automent you will have to add extra components. For Example, I started this project to allow the deployment to a on premise Kubernetes cluster, so i had to install the `kubectl` command. 


# How to build the image
To build this image we need to used the `--build-arg` param for the docker build. 
```
ARGS
    RUNNER_VERSION #Github runner version which we want to use.

Ex:
    docker build --build-arg RUNNER_VERSION=2.273.0 -t github-runner:2.273.0 .
```

# How to run the image

## Environment Variables
* GITHUB_REPO: Repository url where the action will be configured.
* GITHUB_ACTION_TOKEN: Given token by the github action setting.
  
## Docker run
    `docker run -e GITHUB_REPO=https://github.com/Pitafoo/strapi-backend -e GITHUB_ACTION_TOKEN=AIIPH4WNF65BIANES3MRCA27KSF3G github-runner:2.273.0 `

## Docker compose
    `docker-compose up -d`


# Reference

* [Github Self Runner Setup](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners)