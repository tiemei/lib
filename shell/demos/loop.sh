#!/bin/bash
outer=1 # 外部变量
for a in 1 2 3 4
do
  echo $outer
  let "outer+=1"
done

for i in {1..5}
do
   echo "Welcome $i times"
done

# [1, 20] step 2
for i in $(seq 1 2 20)
do
   echo "Welcome $i times"
done


for (( c=1; c<=5; c++ ))
do
   echo "Welcome $c times"
done

# 遍历目录中文件
for file in /etc/*
do
  if [ "${file}" == "/etc/resolv.conf" ]
  then
    # do something
    break
  fi

  if [ "${file}" == "/etc/resolv.conf" ]
  then
    continue
  fi
done







