## Getting ready:

**The major requirements are:**

* python 3
* [pytorch](http://pytorch.org/)
* tensorflow-gpu
* CUDA (If you want to do any serious tests! But you can also run simple codes without CUDA/GPU)

Make sure you are in rescomp home folder and nano .bashrc (put: `module use -a /mgmt/modules/eb/modules/all` and `module load Anaconda3/5.1.0`) so that it is linked to modules

### Creating virtual environment

```shell
$ conda create -n aligpu
$ source activate aligpu
(aligpu) $
```

### Pytorch
As explained [here](http://pytorch.org/).
```shell
$ source activate aligpu
(aligpu) $ conda install pytorch torchvision cuda80 -c soumith
or
(aligpu) $ conda install pytorch torchvision -c pytorch (default cuda 8.0, python3.5)
or 
(aligpu) $ conda install pytorch torchvision cuda90 -c pytorch

I did the last one!
```

### Tensorflow and keras

```shell
(aligpu) $conda install -c anaconda tensorflow-gpu

```

```shell
(aligpu) $ conda install -c anaconda keras-gpu
```

### Visualization with tensorboard-pytorch

[tensorboard](https://www.tensorflow.org/get_started/summaries_and_tensorboard) visualization, use [tensorboard-pytorch](https://github.com/lanpa/tensorboard-pytorch).

```shell
$ source activate aligpu
(aligpu) $ pip install tensorboardX
(aligpu) $ pip install tensorflow
```

### Extras (packages that can be a bit tricky to install and may not function)

```shell
(aligpu) $ conda install -c anaconda qt
(aligpu) $ conda install matplotlib (*you might have problem with this if qt latest version is not installed*)
```

### Others

For other packages just use 
   
``` shell
(aligpu) $ conda install $packagename
(aligpu) $ pip install $packagename

```
### Test

- You have to go to the node where gpu is available

```shell
$ qlogin -P rittscher.prjb -q gpu9.q -pe shmem 1 -l gpu=1
$ source activate aligpu(your virtual env.)

```

- Check pytorch-gpu 

```shell
python -c "import torch; print('N GPU: {}'.format(torch.cuda.device_count()))"
```

- Check tensorflow-gpu

```shell
$ python 

>> import tensorflow as tf
>> print(tf.__version__)
>> sess = tf.Session(config=tf.ConfigProto(log_device_placement=True))

```



