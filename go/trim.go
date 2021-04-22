func Trim(s string) string {
  for string(s[0]) == " " {
    s=s[1:]
  }
  for string(s[len(s)-1]) == " " {
    s=s[:len(s)-1]
  }
  return s
}
