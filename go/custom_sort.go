// https://www.codewars.com/kata/55c6126177c9441a570000cc/solutions/go
// https://www.codewars.com/kata/5868b2de442e3fb2bb000119/solutions/go
  sort.SliceStable(v, func(i, j int) bool { return (v[i][0] < v[j][0]) || (v[i][0] == v[j][0] && v[i][1] < v[j][1]) || (v[i][0] == v[j][0] && v[i][1] == v[j][1] && v[i][2] < v[j][2])})
