package main

import (
	"fmt"
	"math"
)

type Vertex struct {
	X, Y float64
}

// 在func跟函数名之间插入需要增加方法的结构体
func (v *Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func main() {
	v := &Vertex{3, 4}
	fmt.Println(v.Abs())
}
