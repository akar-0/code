// https://www.codewars.com/kata/55c6126177c9441a570000cc/solutions/go
// https://www.codewars.com/kata/5868b2de442e3fb2bb000119/solutions/go
  sort.SliceStable(v, func(i, j int) bool { return (v[i][0] < v[j][0]) || (v[i][0] == v[j][0] && v[i][1] < v[j][1]) || (v[i][0] == v[j][0] && v[i][1] == v[j][1] && v[i][2] < v[j][2])})

//2-d string slice
func sorted(arr [][]string) [][]string {
  for _,subArr := range arr { sort.Strings(subArr) }
  sort.SliceStable(arr, func(i, j int) bool {
    for x := range arr[i] {
        if x >= len(arr[j]) { return false }
        if arr[i][x] == arr[j][x] { continue }
        return arr[i][x] < arr[j][x]
    }
    return len(arr[i]) < len(arr[j])
  })
  return arr
}
