func Transpose(matrix [][]int) [][]int {
  o := make([][]int, len(matrix[0]))
  for _,row := range matrix {
    for j,cell := range row {
      o[j] = append(o[j], cell)
    }
  }
  return o
}
