func enumerate(a []int) [][2]int {
  res := make([][2]int, len(a))
  for i,e := range a { res[i] = [2]int{i, e} }
  return res
}
