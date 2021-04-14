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
  for 1==1 {
    if IsPrime(n) {
      return n
    } else {n+=2}
  }
  return -1
}
