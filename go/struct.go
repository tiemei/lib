package main

import "fmt"

type s struct {
	a int
	b int
}

func main() {
	x := s{0, 0}
	fmt.Println(x)

	fmt.Println(a(x))  //  值拷贝
	fmt.Println(x)

	fmt.Println(b(&x)) // 引用拷贝
	fmt.Println(x)
}


func a(x s) s {
	x.a = 1
	return x
}

func b(y *s) s {
	y.a = 1
	return *y
}