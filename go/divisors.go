


func countDivisors(n int) int {
  res := 2
  sq := int(math.Sqrt(float64(n)))
  for d := 2 ; d <= sq ; d++ {
    if n % d == 0 { res += 2 }
  }
  if n == sq * sq { res -= 1 }
  return res
}


