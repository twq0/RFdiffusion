#!/bin/bash

# 创建四个目标文件夹
mkdir folder1 folder2 folder3 folder4

# 获取当前目录下所有的文件夹名
folders=($(find . -maxdepth 1 -type d | grep -v './\.'))

# 计算每个文件夹应该移动到哪个目标文件夹
len=${#folders[@]}
each=$((len / 4))

# 移动文件夹到目标文件夹中
for ((i=0; i<len; i++))
do
    if [ $i -lt $each ]; then
        mv "${folders[$i]}" folder1
    elif [ $i -lt $((2 * each)) ]; then
        mv "${folders[$i]}" folder2
    elif [ $i -lt $((3 * each)) ]; then
        mv "${folders[$i]}" folder3
    else
        mv "${folders[$i]}" folder4
    fi
done
