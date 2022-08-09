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





func permutations(a []rune, l int) [][]rune {
  ls := [][]rune{append([]rune{}, a...)}
  c := make([]int, l)
  i := 1
  var k int
  for i < l {
    if c[i] < i {
      if i % 2 == 1 {
        k = c[i]
      } else {
        k = 0
      }
      a[i], a[k] = a[k], a[i]
      c[i]++
      i = 1
      ls = append(ls, append([]rune{}, a...))
    } else {
      c[i] = 0
      i++
    }
  }
  return ls
}



func allPermutations(arr []rune) [][]rune {
  perm := permutations(arr, len(arr), nil)
  res := [][]rune{}
  for i := 1 ; i <= len(arr) ; i++ {
    for _,p := range perm {res = append(res, p[:i])}
  }
  return res
}

func permutations(arr []rune, l int, p [][]rune) [][]rune {
  if l == 1 { p = append(p, append([]rune{}, arr...)) }
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




