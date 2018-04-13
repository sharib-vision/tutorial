### Installed packages


#### conda (installed with python 3.6)
  [link](https://conda.io/miniconda.html)
  	
  		bash Miniconda3-latest-MacOSX-x86_64.sh

#### Essentials
```
cmake3.9.4 (conda install -c anaconda cmake)
conda install -c anaconda *git* (also includes perl package 5.26)
conda install -c menpo eigen  (eigen 3.2.7)
pip install numpy scipy matplotlib scikit-image scikit-learn ipython pandas
```
	 
#### openCV
 [link](https://gist.github.com/jruizvar/0535fb8612afb105e0eef64051dc0d00)
```
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
```
	

		mkdir build
		cd build
		cmake -DPYTHON_DEFAULT_EXECUTABLE=python3 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local -DBUILD_opencv_python2=False -DBUILD_opencv_python3=True -DPYTHON3_EXECUTABLE=python3 ../opencv-3.2.0
		make -j2
		sudo make install
		echo /usr/local/lib/python3.6/site-packages >> /Library/Frameworks/Python.framework/Versions/3.6/lib/python3.6/site-packages/opencv3.pth
		

###### Verify installation
		
		python3 -c "import cv2; print(cv2.__version__)"

###### For python2 support


		cmake .. -DBUILD_opencv_python2=True -DPYTHON2_LIBRARY=$CONDA_PREFIX/lib/libpython2.7.dylib -DPYTHON2_INCLUDE_DIR=$CONDA_PREFIX/include/python2.7 -DBUILD_opencv_python3=False \
		\-DCMAKE_CONFIGURATION_TYPES=Release -DCMAKE_INSTALL_PREFIX=$CONDA_PREFIX -DMKL_INCLUDE_DIRS=/opt/intel/mkl/include\
		-DMKL_ROOT_DIR=/opt/intel/mkl -DWITH_CUDA=OFF -DWITH_CUFFT=OFF -DWITH_MATLAB=OFF


[FeatureMatchingTestSample](http://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_feature2d/py_matcher/py_matcher.html)


###### Fixing problem with matplotlib

- brew install python3
- brew install freetype
- brew install pkg-config
- sudo pip3 install matplotlib

			
#### ITK
```
git clone https://github.com/InsightSoftwareConsortium/ITK.git
```

Building with previous subversions:[link](https://itk.org/Wiki/ITK/Git/Download)
	
Python wrapping [link](https://itk.org/Wiki/ITK/Python_Wrapping)
	
`error: python library mismatch`
	
`fix: -DPYTHON_EXECUTABLE=/usr/bin/python2.7`
	
ITKPython Package ready [link](http://itkpythonpackage.readthedocs.io/en/latest/)
	
	
		
#### brew install parallel
