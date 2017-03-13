#!/urs/bin/bash

/home/mylinux/caffe/build/tools/caffe train \
	--solver=/home/mylinux/caffe/MyProject/CheckAV/solver.prototxt
	--weight=MyProject/CheckAV/bvlc_alexnet.caffemodel -gpu=0

echo "Train Done..."
