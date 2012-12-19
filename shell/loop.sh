#!/bin/bash
outer=1 # 外部变量
for a in 1 2 3 4
do
  echo $outer
  let "outer+=1"
done
