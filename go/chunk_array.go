func chunk(arr []int, step int) []int {
  a, o := make([]int, len(arr)), []int{}
  copy(a, arr)
  if step < 0 {
    for i, j := 0, len(a)-1; i < j; i, j = i+1, j-1 {
        a[i], a[j] = a[j], a[i]
    }
    step*=-1
  }
  for i := 0 ; i < len(a) ; i+=step {
    o = append(o, a[i])
  }
  return o
}
