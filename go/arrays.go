package main

import "fmt"

func main()  {
	// 数组默认值传递
	// refer: http://blog.golang.org/go-slices-usage-and-internals
	// Go's arrays are values. An array variable denotes the entire array;
	// it is not a pointer to the first array element (as would be the case in C).
	// This means that when you assign or pass around an array value you will make a copy of its contents.
	// (To avoid the copy you could pass a pointer to the array, but then that's a pointer to an array, not an array.)
	// One way to think about arrays is as a sort of struct but with indexed rather than named fields: a fixed-size composite value.
	var a [4]int
	printArray(a) // [1 0 0 0]
	fmt.Println(a) // [0 0 0 0]

	// 需要引用传递需借助指针
	var b [4]int
	printArrayByPointer(&b)
	fmt.Println(b)

	// 初始化
	c := [2]string{"Penn", "Teller"}
	d := [...]string{"Penn", "Teller"}
	fmt.Println(c)
	fmt.Println(d)
}

func printArray(a [4]int)  {
	a[0] = 1
	fmt.Println(a)
}

func printArrayByPointer(a *[4]int) {
	a[0] = 1
	fmt.Println(*a)
}

