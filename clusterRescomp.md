## ssh to clusterRescompX

```shell
$ ssh username@rescomp1.well.ox.ac.uk
```

In OSX you need to install and open [XQuartz](https://www.xquartz.org/).

Then loging to the server enabling X11 forwarding.

```shell
$ ssh -X username@rescomp1.well.ox.ac.uk
```

Go ahead and open any GUI you need (e.g., $ gedit textfile).

## Load Anaconda 

Before executing of submiting a task you have to load the modules you will need:

```shell
module use -a /mgmt/modules/eb/modules/all #Add the path where the Anacoda module is located.
module load Anaconda3/5.1.0
```
`Recommended:` Put above two lines in your `.bashrc (nano ~/.bashrc)`

## Create your virtual environment

Before installing any python package it is recommended to create an enviroment as:

```shell
$ conda create --name myenv 
```

You can create a new enviroment with all your required packages using a a .yml file like:

```shell
$ conda create -f my_packages.yml 
```

To activate the enviroment just type:

```shell
$ source activate myenv 
```

If you forgot any packages in your enviorment you can add new ones using:

```shell
$ conda install package_name 
```

More information about anaconda enviroments can be found [here](https://conda.io/docs/user-guide/tasks/manage-environments.html).


## Example of a script file to send to the cluster queue:

```shell
#!/bin/bash

#$ -P rittscher.prjb -q gpu9.q
#$ -l gpu=1 

module use -a /mgmt/modules/eb/modules/all
module load Anaconda3/5.1.0
source activate pytorch90-env

python -c "import torch; print('N GPU: {}'.format(torch.cuda.device_count()))"

echo "Finished at :"`date`
exit 0
```

## Mount the group data directory using ssh (on mac):
[Here](https://susanqq.github.io/jekyll/pixyll/2017/09/05/remotefiles/) are instructions.

In brief install osxfuse and sshfs using homebrew. You can mount the files typing something like:

```shell
$ sudo sshfs -o allow_other,defer_permissions username@rescomp1.well.ox.ac.uk:/well/rittscher/users/ /Volumes/rescomp1
```

``note: for LINUX/Ubuntu defer_permissions has to be replaced with default_permissions``

## Copy data to group data directory using ssh directly (linux/mac):

```shell
$ scp -r fullPathofYourLocalDirectory username@rescomp1.well.ox.ac.uk:/well/rittscher/users/yourAccountName
```

or 

```shell
$ rsync -aP fullPathofYourLocalDirectory username@rescomp1.well.ox.ac.uk:/well/rittscher/users/yourAccountName
```

## Start an interative session on a node:

```shell
$ qlogin -P rittscher.prjb -q short.qb -pe shmem 1 (prj* -q short.q*, '*'--> a/b/c)
```

For GPU clusters you have to specify the number of gpu's or you will not be allowed to start the session.
```shell
$ qlogin -P rittscher.prjb -q gpu8.q -pe shmem 1 -l gpu=1
```

## Start a jupyter notebook in an interactive server:

Start a remote session using tunneling: 

```shell
$ ssh -L 8080:localhost:8080 username@rescomp1.well.ox.ac.uk

$ jupyter notebook --no-browser --port=8080
```

Ipython should print a link with an access token. You can then we can just copy 
and paste the link in your local browser and execute jupyter scripts.

Sometimes the port might be in use. Then change the port and start again.


## Run your script in cluster: 

[Here](https://github.com/BIMSBbioinfo/intro2UnixandSGE/blob/master/sun_grid_engine_for_beginners/how_to_submit_a_job_using_qsub.md) are instructions 

Few most commonly used:

```shell
$ qsub myScript.sh 

$ qsub -l h_vmem=1G,h_rt=01:50:20 -N testCluster myScript.sh

```

To see the jobs in queue or all:

```shell
$ qstat -u $USER

$ qstat -s p/r

$ qsum -u $USER (compact summary, use -h for help)

```

See jobs not in queue:

```shell
$ qstat -f -ne

```

Check/monitor state of execution hosts:

```shell
$ qhost -q

$ qconf -sql

$ qload -u $USER

$ qload -nh -v

```

Assigning your job to a specific node (TODO: need to be checked!!):


```shell
$ qsub -q gpu.q@compG002  -N testGPU myScript.sh (use qhost -q to check possibilities)

$ qsub -q himem.qh@compH000 -N testHighMem myScript.sh

```

Check softwares on the server *before you install one*:

```shell
$ /apps/well/

$ /mgmt/modules/eb/modules 

$ modules avail

```
Check GPU type and capacities:

```shell
$ nvidia-smi
$ print(torch.version.cuda)
```

