#!/bin/bash
#通过手机uc浏览器视频缓存得到的m3u8索引文件里的ts文件路径是在手机本地的绝对路径
#当整个m3u8和ts文件（VideoData文件夹）都从手机复制到电脑后，ts文件的绝对路径变了
#故需要先把m3u8文件中关于ts文件的路径位置改为在电脑上的绝对路径(原来是在手机存储上的绝对路径)

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


