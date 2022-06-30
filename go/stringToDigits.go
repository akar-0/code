func stringToDigitSlice(s string) []int {
  arr := make([]int, len(s))
  for i,d := range s {
    arr[i] = int(d - 48)
  }
  return arr
}
