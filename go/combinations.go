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


// combinations with replacements
// https://www.codewars.com/kumite/629c1b27448d0bdd526839fa?sel=629c1b27448d0bdd526839fa

func combinationsWithReplacement(arr []int, n int) [][]int {
  if n == 1 {
    L := make([][]int, len(arr))
    for i,e := range arr { L[i] = []int{e} }
    return L
  }
  L := [][]int{}
  for i,e := range arr {
    for _,x := range combinationsWithReplacement(arr[i:], n-1) {
      L = append(L, append([]int{e}, x...))
    }
  }
  return L
}


// heap algorithm
func permutations(arr []int, l int, p [][]int) [][]int {
  fmt.Println("", l)
  if l == 1 { p = append(p, append([]int{}, arr...)) }
  fmt.Println("", p)
  for i := 0 ; i < l ; i++ {
    p = permutations(arr, l-1, p)
    if l % 2 == 1 {
      arr[0],arr[l-1] = arr[l-1], arr[0]
    } else {
      arr[i], arr[l-1] = arr[l-1], arr[i]
    }
  }
  return p
}



