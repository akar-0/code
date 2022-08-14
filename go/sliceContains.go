func sliceContains(a []rune, r rune) bool {
  for _,e := range a {
    if e == r { return true }
  }
  return false
}
