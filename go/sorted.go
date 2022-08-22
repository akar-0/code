func sorted(s string) []byte {
  b := []byte(s)
  sort.SliceStable(b, func(i, j int) bool { return b[i] < b[j] })
  return b
}
