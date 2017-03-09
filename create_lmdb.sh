#!/bin/bash

DATA=$(cd `dirname $0`;pwd)
echo '当前地址'$DATA


rm -rf $DATA/image_train_lmdb

/home/mylinux/caffe/build/tools/convert_imageset --shuffle \
$DATA $DATA/train_label.txt $DATA/img_train_lmdb

#测试数据不用--shuffle
/home/mylinux/caffe/build/tools/convert_imageset \
$DATA $DATA/test_label.txt $DATA/img_test_lmdb
