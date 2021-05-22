import "strconv"

func GroupBy(s string) [][]int {
  o := [][]int{}
  i := 0
  l := len(s)
  for i < l {
    n := s[i]
    c := 1
    for i+1 < l && s[i+1] == n {
      i++
      c++
    }
    x,_ := strconv.ParseInt(string(n), 10, 64)
    o = append(o, []int{int(x), c})
    i++
  }
  return o
}
