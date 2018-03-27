## Conda

**Install Conda**

1. Download [link](https://conda.io/miniconda.html)
2. In terminal run: *bash* Miniconda3-latest-Linux-x86_64/macXXX.sh

**Creating local virtual environment for softwares**

	conda create --name myenv
	
	conda create -n myenv python=3.4
	
	conda env create -f environment.yml
	

**Activate** 

	source activate myenv
	
	
**Listing all envs**

	conda env list
	
	conda info --envs
	
```Example
conda environments:
myenv                 /home/username/miniconda/envs/myenv
snowflakes            /home/username/miniconda/envs/snowflakes
bunnies               /home/username/miniconda/envs/bunnies
```

**Single install**

    conda install -c conda-forge opencv

**Sharing an environment**

	source activate myenv
	conda env export > environment.yml
	
**Creating an environment file**

	name: stats2
	channels:
	  - javascript/nodefaults
	dependencies:
	  - python=3.4   # or 2.7
	  - opencv=3.4.1
	  - bokeh=0.9.2
	  - numpy=1.9.*
	  - nodejs=0.10.*
	  - flask
	  - pip:
    		- Flask-Testing

 	#Note: Identation is important

**Removing environment**

	conda remove --name myenv --all
	conda env remove --name myenv
	
#### Example with your CNN: includes Theano, keras and tensorflow [link](https://bitbucket.org/aliNepal/kerastiatf/src/211dc79df45f?at=master)

	name: kerasBackEndTFlow
	channels:
	  - javascript
	dependencies:
	  - pip
	  - pip:
	    - Theano
	    - keras
	    - https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-1.1.0-py2-none-any.whl
    - brew!!!:
    	- 

```
conda env create -f dependenciesInstall.yml
```
