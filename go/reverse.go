func reverse[T comparable](a []T) []T {
    s := append([]T{}, a...)
    sort.SliceStable(s, func(i, j int) bool {
        return i > j
    })
  return s
}

func reverse[T comparable](a []T) []T {
  res := append([]T{}, a...)
   for i, j := 0, len(a)-1; i < j; i, j = i+1, j-1 {
       res[i], res[j] = res[j], res[i]
   }
   return res
}
