#!/bin/bash


#$ -P rittscher.prjc -q gpu8.q -l gputype=p100 
#$ -l gpu=1 -pe shmem 2

## ssh compG005/compG006/compG007

source /etc/profile.d/modules.sh
module use -a /mgmt/modules/eb/modules/all
module load Anaconda3/5.1.0
module load gcc/5.4.0

#source activate TFPytorchGPU
module load cuda/9.0


ROOT_FOLDER=/well/rittscher/projects/felix-Sharib/darknet

# ./imageclassify detector train ${ROOT_FOLDER}/cfg/voc.data ${ROOT_FOLDER}/cfg/yolov3-voc.cfg ${ROOT_FOLDER}/darknet53.conv.74 -gpus 0,1,2,3

from scratch... 
${ROOT_FOLDER}/darknet detector train ${ROOT_FOLDER}/cfg/endo-anchor.data ${ROOT_FOLDER}/cfg/yolo-obj-anchor.cfg ${ROOT_FOLDER}/darknet53.conv.74 -gpus 0,1,2,3
#${ROOT_FOLDER}/darknet detector train ${ROOT_FOLDER}/cfg/endo-anchor.data ${ROOT_FOLDER}/cfg/yolo-obj-anchor.cfg ${ROOT_FOLDER}/backup_anchor/yolo-obj-anchor.backup -gpus 1,2,3


echo "Finished at :"`date`
exit 0
