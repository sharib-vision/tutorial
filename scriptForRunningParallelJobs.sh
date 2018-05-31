#!/bin/bash

#$ -P rittscher.prjc
#$ -q long.qc
#$ -t 7501-8000
#$ -pe shmem 4

### -t 7501-8000 will take 500 separate cores and send each single task to different cores

source /etc/profile.d/modules.sh
module use -a /mgmt/modules/eb/modules/all
module load Anaconda3/5.1.0

## this is my virtual environment with which my executable is built
source activate tools

# note your number of threads should be equal to no. of processes
export OMP_NUM_THREADS=4

export DISPLAY=:0.0

execdir="/users/rittscher/sharib/base/aceColorEnhancement/scripts"
cd $execdir
printf -v sect "%06g" $SGE_TASK_ID

EXE_FOLDER=/users/rittscher/sharib/base/aceColorEnhancement/build
PARENTFOLDER=/well/rittscher/projects/dataset-NS/originalFiles
SUB_DIR=47502_16_601169_RP_6M

#_6N
FILENAME='Tile'${sect}'.jpg'
REUSLT_FOLDER="/well/rittscher/projects/dataset-NS/results/"${SUB_DIR}
resultFileName=${REUSLT_FOLDER}/${FILENAME}
${EXE_FOLDER}/ace ${PARENTFOLDER}/${SUB_DIR}/${FILENAME} -a 8 -m interp:12 ${resultFileName}

echo "me: $sect"
