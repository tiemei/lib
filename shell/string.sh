#!/bin/bash

str=12312345,67890890

# len
echo ${#str}
expr length $str
expr $str : '.*'

# 匹配某一REGX匹配到的字符长度
expr $str : '.*45,'

# 索引
expr index $str '45,'

# 取子串 - 模式匹配
sub=123
printf 'expr match $str ... : '; expr match $str '\(123\)'   # 从开始取到sub
expr $str : '\(123\)'
printf 'expr match $str ... : '; expr match $str '.*\(890\)' # 从结尾取到sub
expr $str : '.*\(890\)'
# 取子串 - index
echo '${str:1} : '${str:1}    # 1位置到末尾的子串
echo '${str:1:2}': ${str:1:2} # 1位置到开始，长度2
expr substr $str 2 2

# 子串删除
echo ${str#*123}  # 开头开始最小匹配
echo ${str##*123} # 开头最大匹配
echo ${str%890*}  # 结尾最小匹配
echo ${str%%890*} # 几位最大匹配

# 子串替换
repl=repl
echo ${str/$sub/$repl}  # 替换第一个
echo ${str//$sub/$repl} # 替换所有
echo ${str/#$sub/$repl} # 如果repl匹配str的开头部分，替换
echo ${str/%890/$repl}  # 如果repl匹配str的结尾部分，替换
