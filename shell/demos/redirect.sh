#!/bin/bsh

# @author tiemei
# @date   12 02 2012

# 重定向：捕捉一个文件，命令，程序，脚本甚至是脚本中代码块的输出，
# 将这些输出作为输入发送到另一个文件，命令...

# 默认三个文件才处于打开状态:stdin(键盘) stdout(屏幕) stderr(错误消息到屏幕)
# 每个打开的文件对应一个文件描述符(类似一个指针)，上面上个分别对应0 1 2
# 对打开的额外文件，保留了3-9的描述符(最好不要用fd 5,自己称会继承fd 5)

:> file  # 清空文件内容，若原文件不存在等效touch
> file   # 等效上条，但某些shell下不能工作
&> file  # 将stdout stderr都重定向到file

echo msg 1> file # 重定向stdout到file，这一行结束后，会自动reset

2>&1 # 重定向stderr到stdout
i>&j # 重定向文件描述符i到j
>&j  # 重定向文件描述符1(stdout)到j
0< file
< file # 从文件中接受输入

[j]<> file # 为了读写文件，将文件打开，并赋予描述符j
           # 若file不存在，创建它；如果j没有指定，默认0
           # e.g. 写到一个文件中指定的地方
           # echo 12342 > file 
           # exec 3<> file; read -n 4< &3 # 只读四个字符
           # echo -n . >&3; exec 3>&- # 关闭fd 3,重定向到stdout
           # cat file # => 1234.2 

ls -yz >> out 2>&1 # ok
ls -zy 2>&1 >> out # no work

n<&- # 关闭输入fd n
0<&-, <&- # 关闭stdin
n>&- # 关闭输出fd n
1>&-, >&- # 关闭stdout

# 子进程集成了打开的文件描述符
exec 3>&1 # 让fd 3指向stdout,即保存当前stdout的'值'
ls -l 2>&1 >&3 3>&- | grep bad 3>&- # 对grep关闭fd 3，但不关闭ls
exec 3>&- # 对剩余的脚本关闭fd 3

# exec < file 将stdin重定向到file
# ================= start =======================
exec < file # 后面的额输入都来自这个文件
exec 6<&0 # save stdin
exec < data-file # stdin -> data-file
read a1 # read line 1
read a2 # read line 2

exec 0<&6 6<&- # reset stdin , close fd 6(let fd 6 used by other progress)
               # same : <&6 6<&-
# ================= end =======================

# exec > file 将stdout重定向到file
# ================= start =======================
LOGFILE=logfile.txt
exec 6>&1 # save stdout, fd 6 -> stdout
exec > $LOGFILE # stdout -> logfile
# ... output to logfile
exec 1>&6 6>&- # reset stdout, close fd 6
# ================= end =======================

# exec 一个脚本中重定向stdin stdout
# ================= start =======================
exec 4<&0
exec < $1 # 从参数1指定的文件中读取
exec 7>&1 
exec > &2 # 写入参数2指定的文件

cat - | tr a-z A-Z # $1 输出到 $2

exec 1>&7 7>&- # reset stdout ,close fd 7
exec 0<&4 4<&- # reset stdin , close fd 4
# ================= end =======================

# exec 避免子shell不可存取变量问题
# ================= start =======================
cat file | while read line; # 管道产生子shell
do
  echo $line
  (( Lines++ ))
done
echo $Lines # => 0

exec 3<> file
while read line <&3
do
  echo $line
  (( Lines++ ))
done
exec 3>&- # close fd 3
echo $Lines # => n ok
# ================= end =======================
