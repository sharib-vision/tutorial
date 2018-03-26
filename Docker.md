## Docker

**Install**

1. [Download](https://store.docker.com/search?type=edition&offering=community)
2. docker run hello-world
3. write your container file (**_Dockerfile_** [Link](/Users/shariba/Documents/deployment))

		FROM ubuntu:14.04
	    RUN apt-get update
	    RUN apt-get install -y curl
	

4. build 

		docker build -t myfirstdocker:latest .  
		# Create image using this directory's Dockerfile
		
		docker container ls -a 
		
		
4. bind volumes [link](https://docs.docker.com/storage/volumes/)

		$ docker run -d \
	  		--name=nginxtest \
	 		-v nginx-vol:/usr/share/nginx/html \
	  		myFirstDocker:latest
	
5. run
		
		docker run -p 4000:80 myfirstdocker:latest  
		# Run "myfirstdocker:latest" mapping port 4000 to 80
		
		sudo docker run -ti --rm myfirstdocker:latest  /bin/bash

6. register and run
	
		docker push username/repository:tag            
		# Upload tagged image to registry
		docker run username/repository:tag                   
		# Run image from a registry
	
	

6. remove

		docker container rm <hash> 
		
		docker container rm $(docker container ls -a -q)   
		# removes all
		
		docker image rm <image id> 
		
		docker image rm $(docker image ls -a -q)
		
		 