#!/bin/bash

# let arg [arg ...] let将参数作为算数表达式计算

let x=-10 y=x+++10; echo $x $y
let x=10 x\!; echo $x # !符号前面要用转义字符,&& ^  || 等也需要转义,也可用(())代替
# 支持的运算符，优先级递减
#  id++, id--    运算后加，运算后减
#  ++id, --id    运算前加，运算前减
#  -, +        一目减，一目加 (x=-10, -x 为 10)
#  !, ~        逻辑非，按位反
#  **        乘方
#  *, /, %       乘，除，求余
#  +, -        加法，减法
#  <<, >>        按位左移，按位右移
#  <=, >=, <, >    大小比较
#  ==, !=        相等，不等
#  &        按位与
#  ^        按位异或
#  |        按位或
#  &&        逻辑与
#  ||        逻辑或
#  expr ? expr : expr   条件操作
#  =, *=, /=, %=,
#  +=, -=, <<=, >>=,
#  &=, ^=, |=    


# (()) [[]]
let x=2 y=2**3
(( w=(y/x) + ( (~ ++x) & ox0f) ))
echo $? w=$w

# shell执行命令几种方式:
# 1. buidin     不会派生新进程
# 2. 外部命令   即普通的二进制文件，fork出新集成执行，
# 3. shell脚本  子shell中执行
# 4. (()) 子shell
# 5. {} 当前shell
# 6. `` 子shell
# 7. 管道 子shell

# 父子shell变量传递
# 父可export一个变量给子，反过来不行
# 反过来怎么做？
# 1. 通过中间文件
# 2. 放到两个反引号中间
# 3. 用管道
mkfifo -m 777 npipe
(
  subsend=hello word
  echo $subsend > npipe &
)
read pread < npipe
echo $pread
# 4. here doc
read pvar << HERE
  subvar=hello world
  echo $subvar
HERE
