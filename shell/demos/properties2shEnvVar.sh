#!/bin/bash

prop_file=resources/env.properties

get_prop()
{
  propfile=$1
  key=$2
  grep "^${2}=" ${1} | sed "s%${2}=\(.*\)%\1%" # grep出含有某key的行
                                               # sed %相当于/。即只保留()中匹配到的部分
}

trim()
{
  trimmed=$1
  trimmed=${trimmed%% } # 从结尾匹配出所有空格并删除
  trimmed=${trimmed## } # 从开头匹配出所有空格并删除
  echo "$trimmed"
}

# awk用来按符号切分字符串
# sed -e '/^$/d' 删除空白行
`grep -v "^#" $prop_file | sed -e '/^$/d' | while read line 
do
  key=$(echo $line | awk -F "=" '{print $1}')
  trimmed_key=$(trim $key)
  trimmed_val=$(trim $(get_prop $prop_file "$key"))
  echo "export $trimmed_key=\"$trimmed_val\""
done`
