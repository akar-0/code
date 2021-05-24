import "math"

func Hypot(a []int, b []int) float64 {
  var d float64
  for i,x := range a {
    d += math.Pow(float64(x) - float64(b[i]), 2)
  }
  return math.Sqrt(d)
}
