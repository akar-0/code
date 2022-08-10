import (
  "math"
)

func factors(n int) map[int]int {
  m := n
  s := int(math.Sqrt(float64(n)))
  var a []int
  b := [3]int{2, 3, 5}
  c := [8]int{4, 2, 4, 2, 4, 6, 2, 6}
  d := make(map[int]int)
  p := 7
  i := 0

  if n < 2 {
    d[n] = 1
    return d
  }

  for _,p := range b {
    for m%p == 0 {
      a = append(a,p)
      m /= p
    }
  }

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



package kata



import (
  "math"
)

var primes = []int{2,3}
var h = make(map[int]bool)

func makePrimes() {
  if len(primes) > 2 { return }
  n := 30000
  var c int
  if (n % 6) > 1 { c = 1 }
  n = []int{n, n - 1, n + 4, n + 3, n + 2, n + 1}[n%6]
  ls := make([]bool, n/3)
  
  for i := 1 ; i < n / 3 ; i++ {
    ls[i] = true
  }
  sq := int(math.Sqrt(float64(n)))
  for i := 0 ; i <= sq / 3 ; i++ {
    if ls[i] {
      j := (3*i+1)|1
      h := j * j
      for e := h / 3 ; e < len(ls) ; e += 2 * j {
        ls[e] = false
      }
      for e := (h+4*j-2*j*(i%2))/3 ; e < len(ls) ; e += 2 * j {
        ls[e] = false
      }
    }
  }
  for i := 1 ; i < n/3 - c ; i++ {
    if ls[i] {
      primes = append(primes, (3*i+1)|1)
    }
  }
  for _,p := range primes { h[p] = true }
}

func BigPrimefacDiv(n int) []int {
  makePrimes()
  if n < 0 { n = -n }
  if h[n] { return nil }
  var i, x, y int
  var flag bool
  p := primes[0]
  for p * p <= n {
    p = primes[i]
    i++
    if n % p == 0 {
      y = p
      if ! flag {
        n /= p
        x = n
        flag = true
      }
      for n % p == 0 { n /= p }
    }
  }
  if x == 0 { return nil }
  if n == 1 { return []int{y, x} }
  return []int{n, x}
}


