#### Getting started and basics on usages

- Login

ssh username@rescomp1.well.ox.ac.uk

- Installations

	- create your own environment.yml(example [here](https://gitlab.com/sharibOx/tutorials/blob/master/environment.yml)) file depending upon what you want to install 


- Example to run keras with tensorFlow backend

```
module use -a /mgmt/modules/eb/modules/all #Add the path where the Anacoda module is located.
module load Anaconda3/5.1.0
module load cuda/9.0 

conda env create -f environment.yml

source activate kerasBackEndTFlow

```

- To check all your installed packages

```
conda list (check if all packages that you want are installed correctly)
pip list (if you have installed using pip)
```

- To test the gpu (will only show no error if GPU is available)

```
import tensorflow as tf
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))

```

If above prints you the name of the GPU then voila you are ready to go!


- To use cluster and notebook (see [here](https://gitlab.com/sharibOx/tutorials/blob/master/clusterRescomp.md) )

About gpu see [here](https://rescomp.well.ox.ac.uk/wiki/Using_the_Rescomp_GPU_resources) <--- requires your credentials

**Note if you go into different node then you will need to do activate your environment again (before that use `module use -a /mgmt/modules/eb/modules/all` + `module load Anaconda3/5.1.0`)**

