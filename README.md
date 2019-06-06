This repo serves as a template for Python Dockers which exit after the execution of a python script. 

# 1. Create Docker Image

First we have to create a Docker-image. For this we will need to have a look at how to structure our Dockerfile. 
As in our case we wanted to run a Python-Procedure we used an image with preinstalled anaconda/miniconda of continuum. 
Furthermore we need to copy the following files to our docker-container. Have a look at the Dockerfile to see how its done

In the Dockerfile we create a new conda environment and install all its packages defined in the environment.yml in it.
On Entry we start the run.py script. The Docker container will exit after Python script was executed and you will 
be back at your command line 

Lastly, build and test your docker container locally with the following commands

    SERVICE_NAME=my_service
    IMAGE_TAG="latest"
    
    docker build -t ${SERVICE_NAME}:${IMAGE_TAG} .
    docker run -e ENVIRONMENT=local_docker \
               --network="host"\
               -it -t ${SERVICE_NAME}:${IMAGE_TAG} 

which are executing the following script (run.py) with output: 

    >>> Docker works in local_docker.
    
The --network flag is here not needed  but if you would like to know how you can use your hosting machines connections, 
this is how its done.