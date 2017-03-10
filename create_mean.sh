#!/usr/bin/bash

/home/mylinux/caffe/build/tools/compute_image_mean \
/home/mylinux/caffe/MyProject/CheckAV/train_lmdb \
/home/mylinux/caffe/MyProject/CheckAV/img_mean.binaryproto

echo 'Done'
