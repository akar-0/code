
function primeFactors(n){
  var m=n
  var arr=[]
  for (p of [2,3,5]){
    if (!(m%p)){
        var e=1
        m /=p
        while (!(m%p)){
          e++
          m /= p 
          }
        arr.push([p, e])
        }
  }
  var p=7, i=0
  const c=[4, 2, 4, 2, 4, 6, 2, 6]
  while (m != 1 || p*p<n){
    if (!(m%p)){
        var e = 1
        m /=p
        while (!(m%p)){
          e++
          m /= p 
          }
        arr.push([p, e])
        }
    p += c[i]
    i = (i+1)%8
  }
}


function primeFactors(n){
  var m=n
  var arr=[]
  for (p of [2,3,5]){ 
        while (!(m%p)){
          m /= p
          arr.push(p)
        }
  }
  var p=7, i=0
  const c=[4, 2, 4, 2, 4, 6, 2, 6]
  while (m != 1 || p*p<n){
        while (!(m%p)){
          m /= p 
          arr.push(p)
        }
    p += c[i]
    i = (i+1)%8
  }
  if (m>1){return {n:1}}
  return counter(arr)
}
