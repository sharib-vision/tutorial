# Load Anaconda + Cuda 9.0

Before executing of submiting a task you have to load the modules you will need:

```
module use -a /mgmt/modules/eb/modules/all #Add the path where the Anacoda module is located.
module load Anaconda3/5.1.0
module load cuda/9.0 
```

Before installing any python package it is recommended to create an enviroment as:

```
conda create --name myenv 
```

To activate the enviroment just type:

```
source activate myenv 
```

More information about anaconda enviroments can be found [here](https://conda.io/docs/user-guide/tasks/manage-environments.html).


# Example of a script file to send to the cluster queue:

```
#!/bin/bash

#$ -N test-job # name of the job
#$ -P rittscher.prjb -q short.qb #specify to which node queue we send the job (I havent figure out how to send it to the GPU node)
 
echo "Username: " `whoami`
echo $HOME

module use -a /mgmt/modules/eb/modules/all
module load Anaconda3/5.1.0
source activate myenv #activate your local enviroment.

#Here I am assuming pytorch is installed. I am just printing the number of GPU cards available.
python -c "import torch; print('N GPU: {}'.format(torch.cuda.device_count()))"

echo "Finished at :"`date`
exit 0
```

# Mount the group data directory using ssh (on mac):
[Here](https://susanqq.github.io/jekyll/pixyll/2017/09/05/remotefiles/) are instructions.

In brief install osxfuse and sshfs using homebrew. You can mount the files typing something like:

```
sudo sshfs -o allow_other,defer_permissions username@rescomp1.well.ox.ac.uk:/well/rittscher/users/ /Volumes/rescomp1
```

# Start an interative session on a node:

```
qlogin -P rittscher.prjb -q short.qb -pe shmem 1
```

# Start a jupyter notebook in an interactive server:

Start a remote session using tunneling: 

```
ssh -L 8080:localhost:8080 username@rescomp1.well.ox.ac.uk

jupyter notebook --no-browser --port=8080
```

Ipython should print a link with an access token. You can then we can just copy 
and paste the link in your local browser and execute jupyter scripts.

Sometimes the port might be in use. Then change the port and start again.

# Run applications using GUI: 

In OSX you need to install and open [XQuartz](https://www.xquartz.org/).

Then loging to the server enabling X11 forwarding.
```
ssh -X username@rescomp1.well.ox.ac.uk
```

Go ahead and open any GUI you need.









