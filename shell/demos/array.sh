#!/bin/bash
# ${arr[*]}  all of the items in the arr
# ${!arr[*]} all of the inidexes in the arr
# ${#arr[*]} Number of items in the arr
# ${#arr[0]} lenght of item zero

# 一维数组 ======================== 
array=(one two three four [5]=five)
echo "Array size: ${#array[*]}"

echo "Array items:" 
for item in ${array[*]}
do
  printf "  %s \n" $item
done

echo "Array index:"
for index in ${!array[*]}
do
  printf "  %d\n" $index
done

echo "Array items and index:"
for index in ${!array[*]}
do
  printf "%4d: %s\n" $index ${array[$index]}
done

# 多维数组 ======================== 
array=("first item" "seconde item" "third" "item")

echo "Number of items in original array: ${#array[*]}"
for ix in ${!array[*]}
do
  printf "  %s\n" "${array[$ix]}"
done

arr=(${array[*]}) # 扁平化处理
echo "After * unquoted expansion: ${#arr[*]}"
for ix in ${!arr[*]}
do
  printf "  %s\n" "${arr[$ix]}"
done

arr=("${array[*]}") # 加引号的扁平化处理
echo "After * quoted expansion: ${#arr[*]}"
for ix in ${!arr[*]}
do
  printf "  %s\n" "${arr[$ix]}"
done

arr=("${array[@]}") 
echo "After @ quoted expansion: ${#arr[*]}"
for ix in ${!arr[*]}
do
  printf "  %s\n" "${arr[$ix]}"
done
