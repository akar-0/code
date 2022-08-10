func reverse[T comparable](a []T) []T {
    s := append([]T{}, a...)
    sort.SliceStable(s, func(i, j int) bool {
        return i > j
    })
  return s
}
