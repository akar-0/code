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

func ReverseString(s string) string {
    runes := []rune(s)
    for i, j := 0, len(runes)-1; i < j; i, j = i+1, j-1 {
        runes[i], runes[j] = runes[j], runes[i]
    }
    return string(runes)
}


func reverseSlice(a []string) []string {
    for i, j := 0, len(a)-1; i < j; i, j = i+1, j-1 {
        a[i], a[j] = a[j], a[i]
    }
    return a
}

func reverse(bytes []byte) string {
    for i, j := 0, len(bytes)-1; i < j; i, j = i+1, j-1 {
        bytes[i], bytes[j] = bytes[j], bytes[i]
    }
    return string(bytes)
}
