#/usr/bin/sh

Ech1='生成第'
Ech2='个文件标签'
path_train='/train/'
path_test='/test/'
l=.jpg\ 1
for ((i=1;i<=9000;i++))
do
	label=$i$l
	echo $Ech1$i$Ech2
	echo $path_train$label >> train_label.txt
done

for ((i=9001;i<=10000;i++))
do
	label=$i$l
	echo $Ech1$i$Ech2
	echo $path_test$label >> test_label.txt
done

s=.jpg\ 0
for ((i=10001;i<19000;i++))
do
	label=$i$s
	echo $Ech1$i$Ech2
	echo $path_train$label >> train_label.txt
done

for ((i=19001;i<=20000;i++))
do
	label=$i$s
	echo $Ech1$i$Ech2
	echo $path_test$label >> test_label.txt
done
