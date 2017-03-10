#!/urs/bin/bash

/home/mylinux/caffe/build/tools/caffe train \
	--solver=/home/mylinux/caffe/MyProject/CheckAV/solver.prototxt
	--weight=/home/mylinux/caffe/MyProject/CheckAV/VGG_FACE.caffemodel -gpu=0

echo "Train Done..."
