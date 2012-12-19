#!/bin/bash

# 1. 指定换行符读取
IFS="
"
for LINE in `cat file`
do
  echo $LINE
done

# 2. 文件重定向给read处理
cat file | while read LINE
do
  echo $LINE
done

# 3. 用read方法读取文件
while read LINE
do
  echo $LINE
done < file
