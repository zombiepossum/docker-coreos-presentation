# Microservices with Docker and CoreOS

This is the presentation and demo for my presentation on Docker and CoreOS.


## Presentation

### Install and Run Presentation
To run the presentation you can go to the presentation directory

run
```bash
npm install
```
then you run
```bash
grunt serve
```

### Links in Presentation

- [Twitter Account @jmuraski](http://twitter.com/jmuraski)
- [My Linked in Profile](https://www.linkedin.com/in/jmuraski)
- [Martin Fowler Microservices]("http://martinfowler.com/articles/microservices.html)
- [Martin Fowler Microservices Prerequisites](http://martinfowler.com/bliki/MicroservicePrerequisites.html)
- [Boot2Docker reference How to Use Docker on OSX the Missing Guide](http://viget.com/extend/how-to-use-docker-on-os-x-the-missing-guide)
- [Docker File Reference](https://docs.docker.com/reference/builder/)
- [Docker File Best Practices](https://docs.docker.com/articles/dockerfile_best-practices/)
- [How to Optimize Your Dockerfile](http://blog.tutum.co/2014/10/22/how-to-optimize-your-dockerfile/)
- [Docker Hub](http://hub.docker.com)
- [Quay.io](http://quay.io)
- [CoreOS Cluster Architectures](https://coreos.com/docs/cluster-management/setup/cluster-architectures/)
- [CoreOS systemd reference](https://coreos.com/using-coreos/systemd/)
- [My Fork of CoreOS Vagrant](https://github.com/jmuraski/coreos-vagrant)


## Docker
In the docker folder there are numerous docker files. The buildAll.sh will go into each folder and run the build.sh. Each build.sh file will build the container and then tag it and push it to docker hub. The location of these containers would need to be changed if you want to run the script yourself. All containers are located at [https://hub.docker.com/u/jmuraski/](https://hub.docker.com/u/jmuraski/) Also if you change it to use your Docker Hub account, make sure to run docker login so you will be able to push images.
