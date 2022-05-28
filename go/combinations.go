func Comb(arr []int, n int) []int {
  if n == 1 {
    return arr
  }
  L := []int{}
  for i := 0 ; i < len(arr)-n+1 ; i++ {
    h := arr[i]
    a := Comb(arr[i+1:], n-1)
    for _,x := range a {
      L = append(L, x+h)
    }
  }
  return L
}


// Permutations
// https://www.codewars.com/kumite/629287c838050ccf7cfb8c76?sel=629287c838050ccf7cfb8c76
