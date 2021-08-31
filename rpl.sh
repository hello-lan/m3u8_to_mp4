#!/bin/bash

#src="VideoData"
#dst="tmp"
src=$1  # 原来的m3u8文件所在的目录
dst=$2  # 替换后的m3u8文件保存目录
origin=$3   # 将被替换的路径
target=$4   # 目标路径

origin_=${origin//\//\\/}  # 转义路径斜杠
target_=${target//\//\\/}  # 转义路径斜杠

IFS=$'\n'
for file in `ls $src | grep ".m3u8$"`
do
    fpath=$src/$file
    dst_path=$dst/$file
    sed "s/$origin_/$target_/" $fpath > $dst_path  # 替换m3u8文件中的路径信息
done


