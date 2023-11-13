#!/bin/bash

# 创建四个子文件夹
mkdir folder1 folder2 folder3 folder4

# 将后缀为.pdb的文件列表存储到数组中
files=(*.pdb)

# 获取文件数量
num_files=${#files[@]}

# 计算每个子文件夹中应该有的文件数量
files_per_folder=$((num_files / 4))

# 将文件随机分配到四个文件夹中
for ((i=0; i<${num_files}; i++)); do
    rand=$((RANDOM % 4 + 1))
    mv "${files[$i]}" "folder${rand}/"
done

echo ".pdb文件已随机等分到四个子文件夹中。"
