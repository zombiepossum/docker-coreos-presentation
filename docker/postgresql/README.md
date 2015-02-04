# Postgresql Docker Files
These files are here to create a Postgres Docker server instance and the additional scripts are helpers

### Dockerfile  
Main file for creating the image for Postgresql

### mapPorts.sh
File that is used to map the boot2docker virtual box instance ports for use from outside docker

### build.sh
File is used to build the docker image based on the Dockerfile

### initialRun.sh
Used to run the image the first time and give it a consistent name and consitent options such as port

### run.sh
Used to start the image after the initial run. This script starts the image based on the name created on initial run

### inspectFiles.sh
Creates a docker process that mounts the postgresql drives to that you can view the logs
