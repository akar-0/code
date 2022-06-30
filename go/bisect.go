// https://www.codewars.com/kumite/62bd22e2aced6309303795fa?sel=62bd22e2aced6309303795fa

func bisect(m float64, L *[]int) int {
  lo, hi := 0, len(*L)
  var mid int
  for lo < hi {
    mid = (lo + hi) / 2
    if m == float64((*L)[mid]) {
      return mid
    } else if m < float64((*L)[mid]) {
      hi = mid
    } else {
      lo = mid + 1
    }
  }
  return lo
}
