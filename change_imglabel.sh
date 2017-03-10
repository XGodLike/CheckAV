#!/bin/bash
path=$(cd `dirname $0`; pwd)
img_n='/imgs_n'
img_p='/imgs_p'
img_train='/train'
img_test='/val'

path_n=$path$img_n
path_p=$path$img_p
path_train=$path$img_train
path_test=$path$img_test

i=1

if [ ! -d $path_train ];then
	mkdir $path_train
fi

if [ ! -d $path_test ];then
	mkdir $path_test
fi


file_n=$(ls $path_n)
file_p=$(ls $path_p)
echo $file_n

for file in $file_n
do
	filename=$path_n/$file
	if [ $i -le 7000 ];then
		newFileName=$path_train/$i.jpg
	else
		newFileName=$path_test/$i.jpg
	fi
	sudo mv $filename $newFileName
	echo '修改第'$i'个_n_文件'
	let i=i+1
done

for file in $file_p
do
	filename=$path_p/$file
	if [ $i -gt 10000 ];then
		if [ $i -le 17000 ];then
			newFilename=$path_train/$i.jpg
		else
			newFilename=$path_test/$i.jpg
		fi
		sudo mv $filename $newFilename
		echo '修改第'$(($i-10000))'个_p_文件'
		let i=i+1
	fi
done
