
func repeat(e, n int) []int {
  arr := make([]int, n)
  for j := range arr { arr[j] = e }
  return arr
}
