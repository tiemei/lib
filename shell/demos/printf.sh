#!/bin/bash
printf "%s\n" "hello printf" # 一行
printf "%s\n" "hello printf" "in" "bash script" # 三行
printf "%s\t%s\n" "1" "2 3" "4" "5" # 两行，制表符分隔

printf "%s\n" "1" "2" "\n3" # 不会解释\n
printf "%b\n" "1" "2" "\n3" # 会解释\n

# %-10s 最少10位字符串，左对齐
# %08d  不足8位前补零
# %11.2f 精度2
printf "%d\n" 255 0xff 0377 3.5 # 整数，3.5不能正常解释
printf "%03d\n" 1 2 # 至少三位，不够前面补零
printf "%f\n" 255 0xff 0377 3.5 # 浮点型，默认六位进度
printf "%.1f\n" 255 0xff 0377 3.5 # 一位精度


# 一个输出table的demo ================== 
divider===============================
divider=$divider$divider

header="\n %-10s %8s %10s %11s\n" # 10 + 8 + 10 + 11 = 39
format=" %-10s %08d %10s %11.2f\n"

width=43

printf "$header" "ITEM NAME" "ITEM ID" "COLOR" "PRICE"

printf "%$width.${width}s\n" "$divider" # 43位长

printf "$format" \
Triangle 13  red 20 \
Oval 204449 "dark blue" 65.656 \
Square 3145 orange .7

