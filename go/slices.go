package main

import (
	"fmt"
)

func main() {
	// 初始化
	letters := []string{"a", "b", "c", "d"}
	printSlice4String("letters", letters)

	// make方法初始化
	// make allocates an array and returns a slice that refers to that array
	s := make([]byte, 5, 5) // s == []byte{0, 0, 0, 0, 0}
	printSlice4byte("s", s)


	// slices与数组的关系
	// slices包含三个元素：一个指向array某端的指针，一个len，一个cap
	// The length is the number of elements referred to by the slice.
	// The capacity is the number of elements in the underlying array (beginning at the element referred to by the slice pointer).
	d := []string{"1", "2", "3", "4", "5"}
	e := d[2:4]
	e[1] = "0"
	printSlice4String("d", d)
	printSlice4String("e", e)

	// 二次slices
	// Earlier we sliced s to a length shorter than its capacity. We can grow s to its capacity by slicing it again.
	//  有两个原则：
	// A slice cannot be grown beyond its capacity
	// Similarly, slices cannot be re-sliced below zero to access earlier elements in the array.
	e = e[:cap(e)]
	printSlice4String("e", e)

	// 复制操作
	// func copy(dst, src []T) int
	// 如果两个slices指向同一个数组，copy函数也能正确处理
	// 如果目标slices放不下，只拷贝木白哦slices长度的数据

	// append操作
	//

}

func printSlice4String(s string, x []string) {
	fmt.Printf("%s len=%d cap=%d %v\n",
		s, len(x), cap(x), x)
}

func printSlice4byte(s string, x []byte) {
	fmt.Printf("%s len=%d cap=%d %v\n",
		s, len(x), cap(x), x)
}
