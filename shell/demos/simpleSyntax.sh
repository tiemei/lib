# 本文件示例，无法直接运行
 
# 1. 检查命令是否执行成功
# 2. 将标准输出与错误输出重定向到/dev/null
# 3. awk
# 4. 将一个文件的所有行用逗号连接
# 5. 过滤重复行
# 6. 临时设置环境变量
# 7. $1 $2 等位置参数的使用，只想使用$2...
# 8. 参数默认值
# 9. 函数返回值默认是最后一行语句的返回值
# peintf 用-v参数赋值
# ++运算
# 获取软连接的真实文件名
# 清空一个文件
# here document 放弃临时文件
# (cmd) &  就能fork一个子shell在后台执行 	  
# `cat file | vim -` 直接vim查看


# 1. 检查命令是否执行成功
# 1.1 常见
echo abcee | grep -q abc
if [ $? -eq 0 ]; then
  echo Found
else
  echo Not Found
fi
# 1.2 简洁写法
if echo abcdee | grep -q abc; then
  echo Found
else
  echo Not Found
fi
# 1.3 很酷，可读性差
echo abcee | grep -q abc && echo Found || echo Not found

# --------------------------------
# 2. 将标准输出与错误输出重定向到/dev/null
grep 'abc' file 1>/dev/null 2>$1 # ok
grep 'abc' file &>/dev/null # ok & simple

# -------------------------------
# 3. awk
cat file | grep vm_name | awk '{prin $2}'
cat file | awk '/vm_name/{print $2}'

# --------------------------------
# 4. 将一个文件的所有行用逗号连接
sed ':a,$!N;s/\n/,/;ta' file # sed写法
paste -ed, file # 简洁写法

# ----------------------------------
# 5. 过滤重复行
sort file | uniq
sort file -u 

# ----------------------------------
# 6. 临时设置环境变量
export LC_ALL=zh_CN.UTF-8 ; date # 只是一次使用不合适
unset LC_ALL
LC_ALL=zh_CN.UTF-8 date # 临时

# ---------------------------------
# 7. $1 $2 等位置参数的使用，只想使用$2...
shift ; echo "$@" # 常见做法
echo "${@:2}" # 简洁写法

# -----------------------------------
# 8. 参数默认值
arg=$1
if [ -z "$arg" ]; then
  arg=0
fi

arg=${1:-0} # 简洁写法

# -----------------------------------
# 9. 函数返回值默认是最后一行语句的返回值

# ----------------------------------
var=$(printf '%%%02x' 111) # 转换成十六进制并赋值
printf -v var '%%%02x' 111

# ----------------------------------
# ++运算
a=1
a=`expr a+1`
a=1
let a++
let a+=2

# ----------------------------------
# 获取软连接的真实文件名
readlink /usr/bin/python

# ----------------------------------
# 清空一个文件
echo "" > file
> file # 简单写法

# ------------------------------------
# here document
# a 管道
grep -v 1 file | while read line
do
  let a++
  echo --$line--
done
echo a:$a  # 因为a变量在管道后面的子shell,父shell不会有变量a
# b 临时文件
grep -v 1 file > tmpfile
while read line
do
  let a++
  echo --$line--
done < tmpfile
echo a:$a
rm -f tmpfile # 临时文件不优雅
# c here doc
while read line2
do
  let b++
  echo ??$line2??
done << EOF
  `grep -v 1 file` # 讲结果存储在临时空间作为输出
EOF
echo b:$b

# --------------------------
# (cmd) &  就能fork一个子shell在后台执行 	  
job_num=10
function do_work()
{
  echo "Do work.."
}
for ((i=0; i<job_num; i++))
do
  echo "Fork job $1"
  (do_work) &
done
wait # 等待所有子进程（子shell）结束
echo "All jobs done"

