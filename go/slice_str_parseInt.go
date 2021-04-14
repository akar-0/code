// https://www.codewars.com/kata/56a4872cbb65f3a610000026/solutions/go
import (
  "strconv"
  )

s := strconv.FormatInt(int64(n),10)

n, err := strconv.Atoi(s)
