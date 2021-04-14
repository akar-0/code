    for i, j := 0, len(r)-1; i < j; i, j = i+1, j-1 {
        r[i], r[j] = r[j], r[i]
    }
    s := string(r)
func Rev(n int) int{
  o := 0
  for ; n>0 ; n/=10 {
    o = o*10+n%10
  }
  return o
}
