#!/bin/bash
# 将src目录下的所有m3u8文件转换成mp4格式，转换得到视频文件保存在dst目录下

src=$1  # 原来的m3u8文件所在的目录
dst=$2  # 替换后的m3u8文件保存目录

IFS=$'\n'
for file in `ls $src | grep ".m3u8$"`
do
    fpath=$src/$file
    dst_path=$dst/${file//.m3u8/.mp4}
    ffmpeg -allowed_extensions ALL -protocol_whitelist "file,http,crypto,tcp" -i $fpath -c copy $dst_path
done


