// https://www.codewars.com/kata/52bc74d4ac05d0945d00054e/solutions/go

  d := make(map[string]int)
  for _,r := range s {
    d[strings.ToLower(string(r))]++
  }
