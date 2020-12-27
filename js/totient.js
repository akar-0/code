function eulersTotientFunction(n) {
    if (n==1){return 1}
    for (p of primeFactors(n)){n -= n/p}
    return n
}
function primeFactors(n){
  var m=n
  var S=new Set()
  for (p of [2,3,5]){ 
        while (!(m%p)){
          m /= p
          S.add(p)
        }
  }
  var p=7, i=0
  const c=[4, 2, 4, 2, 4, 6, 2, 6]
  while (m != 1 || p*p<n){
        while (!(m%p)){
          m /= p 
          S.add(p)
        }
    p += c[i]
    i = (i+1)%8
  }
  if (m>1){S.add(n)}
  return S
}
