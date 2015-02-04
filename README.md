# Microservices with Docker and CoreOS

## Presentation
To run the presentation you can go to the presentation directory

run
```bash
npm install
```
then you run
```bash
grunt serve
```

## Docker
In the docker folder there are numerous docker files. The buildAll.sh will go into each folder and run the build.sh. Each build.sh file will build the container and then tag it and push it to docker hub. The location of these containers would need to be changed if you want to run the script yourself. All containers are located at [https://hub.docker.com/u/jmuraski/](https://hub.docker.com/u/jmuraski/)
