## Docker

**Install**

1. [Download](https://store.docker.com/search?type=edition&offering=community)
2. (Opt) Install visual studio code, bash-completion (can be installed with brew then link installing bash completion given in docker doc) 
2. Dockers automated script to add repository and install all dependencies in Linux
    
```shell
$ curl -sSL https://get.docker.com/ | sh
$ sudo usermod -aG docker $UserName
```

3. Install docker-machine, docker-compose
4. Install docker in visual studio code (in mac put the application/visual.../bin in your .bash_profile)
5. Do code . from the folder of docker user folder (i.e. place with your codes that you want to create an image file)
3. For windows 10 pro/ent you can use docker (go to 1, use powershell, use docker version) otherwise only Docker Toolbox available (see 5)
4. You can install posh-docker (see docker docs for details, this is just auto-completion for docker commands, extra tools: Cmder.net, download and extract to run (unblock before zipping)-->docker machine env default--> copy and paster last line)
5. Win7/8/10 home: Runs tiny linux VM in virtualBox via docker-machine (go to store and click on Dockertoolbox --> check all options)
6. You can shutdown VM and then change settings (like memory) or docker-machine ls (/start/stop etc...) 
7. Make sure the code in C:\Users only (Bind Mounts)
2. docker run hello-world


**Container and image**
- Image: build in binaries that we want to run -
- Container: is an instance of the image running as a process (can be many of the same image)
- Docker Hub (hub.docker.com): default image registry (a remote image repository)
- Docker is actually a process in host machine rather than a Virtual Machine

*Example*
 
 Using image ``ngnix``

```shell
$ docker container run --publish 80:80 nginx
```
 - once running, open your  browser and type: localhost and enter
 - To run in background
```shell
$ docker container run --publish 80:80  --detach --name $yourpreferredName nginx
$ docker container logs $yourpreferredName`
$ docker top $yourpreferredName
```
 
    To stop: 
 ```shell
 $ docker container stop first 3 nos of containerID (docker container ls -a should show exited)
 ```
 
    To remove container:
 ```shell
$ docker container rm -f 3digits
```

 write your container file (**_Dockerfile_** [Link](/Users/shariba/Documents/deployment))

		FROM ubuntu:14.04
	    RUN apt-get update
	    RUN apt-get install -y curl
	

 **build** 
```shell
$ docker build -t myfirstdocker:latest . 
```
		
---> Create image using this directory's Dockerfile
	
See the list of containers

```shell
$ docker container ls -a
``` 
		
 **bind volumes** [link](https://docs.docker.com/storage/volumes/)

		$ docker run -d \
	  		--name=nginxtest \
	 		-v nginx-vol:/usr/share/nginx/html \
	  		myFirstDocker:latest
	
 **run**
 
```shell
$ docker run -p 4000:80 myfirstdocker:latest 
``` 

--> Run "myfirstdocker:latest" mapping port 4000 to 80
	
```shell
$ sudo docker run -ti --rm myfirstdocker:latest  /bin/bash
```

**register and run**
	`
```shell
$ docker push username/repository:tag  
```

- Upload tagged image to registry

```shell
$ docker run username/repository:tag  
```
		
- Run image from a registry
	
**remove/stop**

```shell
$ docker container rm <hash>
```

```shell
$ docker image rm <image id> 
```
		
- Removes all:

```shell
$ docker container rm $(docker container ls -a -q) 
```

```shell
$ docker image rm $(docker image ls -a -q)
```
      
- Forcefull:
		
```shell
$ docker container rm -f $(docker container ls -a -q) 
```
		
- stop
	
```shell
$ docker stop $(docker ps -a -q)
```
  
### GUI

open -a XQuartz


In the XQuartz preferences, go to the “Security” tab and make sure you’ve got “Allow connections from network clients” ticked:

ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ip


-e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix

[plugins](http://www.open-terrain.org/index.php/Pong/August30th2016QMediaPlayerOnUbuntu16-04LTS)

docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix:rw -e DISPLAY=unix$DISPLAY --device /dev/dri --privileged ubuntu 

Then

apt update && apt install --no-recommends -y nvidia-340 mesa-utils && glxgears
    
        
		
		 