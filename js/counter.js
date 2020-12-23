function counter(e){
 C = {}
  for (i of e){
    if (!C[i]){
      C[i] = 1
    }
    else {C[i]++}
  }
  return C
}
