## Docker

**Install**

1. [Download](https://store.docker.com/search?type=edition&offering=community)
2. (Opt) Install visual studio code, bash-completion (can be installed with brew then link installing bash completion given in docker doc) 
2. Dockers automated script to add repository and install all dependencies in Linux
    
    `curl -sSL https://get.docker.com/ | sh
    sudo usermod -aG docker $UserName`

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
- Docker Hub (hub.docker.com): default image registry

*Example*
2. Using image ''ngnix'''
    `docker container run --publish 80:80 nginx`
    
    once running, open your  browser and type: localhost and enter

    To run in background
    
     `docker container run --publish 80:80  --detach --name $yourpreferredName nginx`
     `docker container logs $yourpreferredName`
     
     To stop: 
     `docker container stop first 3 nos of containerID (docker container ls -a should show exited)`
     
    To remove container:
    `docker container rm -f 3digits`
    
    
    

3. 
    





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
		
	- remove forcefully
	
        docker stop $(docker ps -a -q)
        docker rm $(docker ps -a -q)
    
        'or'

        docker rm -f $(docker ps -a -q)
    
        
		
		 