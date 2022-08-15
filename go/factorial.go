func factorial(someNumber int) *big.Int {
  result := big.NewInt(1)
  for number := 2 ; number <= someNumber ; number++ {
    result = new(big.Int).Mul(result,  big.NewInt(int64(number)))
  }
  return result
}
