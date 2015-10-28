package main


import (
	"fmt"
	"math"
)

type MyFloat float64

// 你可以对包中的 任意 类型定义任意方法，而不仅仅是针对结构体。
// 但是，不能对来自其他包的类型或基础类型定义方法。
// 方法可以与命名类型或命名类型的指针关联，选择的依据是函数的目的是改变原来的值，还是修改拷贝的值。
// 如果要修改原来的值，需呀使用引用。
func (f MyFloat) Abs() float64 {
	if f < 0 {
		return float64(-f)
	}
	return float64(f)
}

func main() {
	f := MyFloat(-math.Sqrt2)
	fmt.Println(f.Abs())
}
