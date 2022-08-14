func isSquare(n int) bool {
  return n == int(math.Pow(math.Round(math.Sqrt(float64(n))), 2.0))
}

func isqrt(n int) int {
  return int(math.Sqrt(float64(n)) + 1e-9)
}
