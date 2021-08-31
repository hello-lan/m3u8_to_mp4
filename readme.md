### ubuntu下如何将手机UC浏览器下载的m3u8格式视频转换为mp4格式？

1. 将手机中含m3u8格式的文件夹整个复制到ubuntu系统中的某个位置（这边以home目录下的‘’视频“文件夹为例）

2. 修改m3u8文件，将其中的文件路径修改成当前的路径

   (m3u8文件从手机里copy到电脑的，视频片段的绝对路径发生了变化，这边需要改成电脑中的绝对路径)
   
   ```bash
   sed "s/\/storage\/emulated\/0\/UCDownloads\/VideoData\//\/home\/humch\/视频\/VideoData/" 3be7c55e2bd1c8da62741fdaa01a520833cf38ee.m3u8.bk  > 3be7c55e2bd1c8da62741fdaa01a520833cf38ee.m3u8   
   ```


3. 通过ffmpeg命令将m3u8文件转换为mp4文件
   ffmpeg -allowed_extensions ALL -protocol_whitelist "file,http,crypto,tcp" -i "3be7c55e2bd1c8da62741fdaa01a520833cf38ee.m3u8" -c copy ../test.mp4

