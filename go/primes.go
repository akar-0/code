import (
  "math"
  "sort"
  "strings"
  "fmt"
)

func factors(n int) map[int]int {
  m := n
  s := int(math.Sqrt(float64(n)))
  var a []int
  d := make(map[int]int)
  
  if n < 2 {
    d[n] = 1
    return d
  }
  for m%2 == 0 {
    a = append(a, 2)
    m /= 2
  }
  for m%3 == 0 {
    a = append(a, 3)
    m /= 3
  }
  for m%5 == 0 {
    a = append(a, 5)
    m /= 5
  }
  c := [8]int{4, 2, 4, 2, 4, 6, 2, 6}
  p := 7
  i := 0
  for m != 1 || p <= s {
    for m%p == 0 {
      a = append(a,p)
      m /= p
    }
    p += c[i]
    i = (i+1)%8
  }
  for _,q := range a {
    d[q]++
  }
 return d
}


func IsPrime(n int) bool {
  if n<2 {return false}
  if n==2 || n==3 || n==5 || n==7 {return true}
  if (n%2)==0||(n%3)==0||(n%5)==0||(n%7)==0 {return false}
  c := [8]int{4, 2, 4, 2, 4, 6, 2, 6}
  p := 7
  i := 0
  for p*p <= n {
    if (n%p)==0 {return false}
    p += c[i]
    i = (i+1)%8
  }
 return true
}
func NextPrime (n int) int {
  if n<2 {return 2}
  if n==2 {return 3}
  if (n%2)==0 {
    n++
  } else {n+=2}
  for true {
    if IsPrime(n) {
      return n
    } else {n+=2}
  }
  return -1
}


import "math/big"

func isPrime(n int) bool { return big.NewInt(int64(n)).ProbablyPrime(0) }


