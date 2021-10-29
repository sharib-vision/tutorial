#### HDS-M05: Deep Learning

- Login to your VM with GPU (*interactive for jupyter-notebook*)

```shell
$ ssh -L 8888:127.0.0.1:8888 $user@bdicdtvm01.bmrc.ox.ac.uk 
```	

- Activate your virtual environment

```shell
$ ml Anaconda3
$ source activate base
```	

- Copy ipython-Notebook downloaded to your home folder 

```shell
$ scp -r folder/file.ipynb /cdthome/$user
```	

- Start Jupyter-notebook where you have your ``ipynb`` files

```shell
$ jupyter-notebook
```	

- Data for *segmentation task* (also provided on **Canvas**)

```shell
/cdtshared/Cohort-2021/HDS-M05/segmentation/MontgomerySet
```	

- Using **tensorboard** (make sure you are logged in interactive session)

```shell
$ tensorboard --logdir runs --port 8888
$ http://127.0.0.1:8888/
```	

- Check GPU usage (e.g. memory, processing etc) 

```shell
$ ssh $user@bdicdtvm01.bmrc.ox.ac.uk 
$ watch nvidia-smi *comment: will continously monitor your session*
```	
