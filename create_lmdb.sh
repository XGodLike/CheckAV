#!/bin/bash

EXAMPLE=/home/mylinux/caffe/MyProject/CheckAV
DATA=/home/mylinux/caffe/MyProject/CheckAV
TOOLS=/home/mylinux/caffe/build/tools

TRAIN_DATA_ROOT=/home/mylinux/caffe/MyProject/CheckAV
VAL_DATA_ROOT=/home/mylinux/caffe/MyProject/CheckAV

RESIZE=true
if $RESIZE;then
	RESIZE_HEIGHT=224
	RESIZE_WIDTH=224
else
	RESIZE_HEIGHT=0
	RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ];then
	echo "Error:TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
	echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
		"where the ImageNet training data is stored"
	exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  exit 1
fi

echo "Creating train lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $TRAIN_DATA_ROOT \
    $DATA/train_label.txt \
    $EXAMPLE/train_lmdb

echo "Creating val lmdb..."

GLOG_logtostderr=1 $TOOLS/convert_imageset.bin \
    --resize_height=$RESIZE_HEIGHT \
    --resize_width=$RESIZE_WIDTH \
    --shuffle \
    $VAL_DATA_ROOT \
    $DATA/test_label.txt \
    $EXAMPLE/val_lmdb

echo "Done."
#rm -rf $DATA/image_train_lmdb

#/home/mylinux/caffe/build/tools/convert_imageset --shuffle \
#$DATA $DATA/train_label.txt $DATA/img_train_lmdb

#测试数据不用--shuffle
#/home/mylinux/caffe/build/tools/convert_imageset \
#$DATA $DATA/test_label.txt $DATA/img_test_lmdb
