#### Basics on usages
contributor: <sharib.ali@eng.ox.ac.uk>, <avelino.javer@eng.ox.ac.uk>


- Run your keras with tensorFlow backend

```
module use -a /mgmt/modules/eb/modules/all #Add the path where the Anacoda module is located.
module load Anaconda3/5.1.0
module load cuda/9.0 

conda env create -f environment.yml

source activate kerasBackEndTFlow

```

- To test the gpu (will only show no error if GPU is available)

```
import tensorflow as tf
sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))

```

If above prints you the name of the GPU then voila you are ready to go!


