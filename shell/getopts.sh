#!/bin/bash

# 命令后接参数处理方法实例
# @author tiemei
# @date   11 08 2012

# shell命令规范简单例子：
# cmd -a -bc -d arg --e --e=arg2 
# 依次 短选项 短选项合并 短选项带参数 长选项 长选项带参数

# 1. 手工处理
# 2. getopts
# 3. getopt


# 1. 手工处理 =======================
# cmd : ./test.sh -f config.conf -v --prefix=/home
# $0 ./text.sh $1 -f $2 config.conf ...
# $# 参数个数 
# $@ "参数1 参数2 .."    参数本身列表 
# $* "参数1" "参数2" ... 和$@相同，但"$*" 和 "$@"(加引号)并不同，"$*"将所有的参数解释成一个字符串，而"$@"是一个参数数组, 
# $? 前一个命令或函数的分那会码
# $$ 本程序的PID
# $! 上一个命令的PID

#if [ x$1 != x ]
#then
#  echo opts exist
#else
#  echo not opts
#fi

# 配合shift使用也能构造出强大的功能

# 2. getopts  =======================
# 不支持长选项

#while getopts "a:hbc" arg # 选项后面的冒号表示该选项需要参数
#do
#  case $arg in
#    a)
#      echo "a's arg:$OPTARG" # 参数存在$OPTARG中
#      ;;
#    b)
#      echo "b"
#      ;;
#    c)
#      echo "c"
#      ;;
#    h)
#      echo -e "-a usage\
#        \\n-b usage\
#        \\n-c usage"
#      ;;
#    ?)  # 不认识的选项
#      echo "unkonwn argument"
#  exit 1
#  ;;
#  esac
#done

# 3. getopt   =======================
# 支持长选项

# : 必须接参数 
# :: 可选参数,紧贴选项 
# -n 出错时的信息
# -- 例，mkdir -- -f建一个名字为-f的目录
TEMP=`getopt -o ab:c:: --long a-long,b-long:,c-long:: -n 'getopts.sh' -- "$@"`

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

eval set -- "$TEMP" # 重排参数的顺序,按下面的声明顺序排

while true ; do
  case "$1" in
    -a|--a-long) echo "Option a"; shift ;;
    -b|--b-long) echo "Option b, argument '$2'"; shift 2 ;;
    -c|--c-long)
      case "$2" in
        "") echo "Option c, no argument"; shift 2 ;;
        *)  echo "Option c, argument '$2'" ; shift 2 ;;
      esac 
      ;;
    --) shift ; break ;;
    *) echo "Internal error!" ; exit 1 ;;
  esac
done

echo "Remaining arguments:"
# 余下的参数 
for arg in "$@"
do
  echo $arg
done
