
function primeFactors(n){
  var m=n
  var arr=[]
  for (const p of [2,3,5]){
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
  for (const p of [2,3,5]){ 
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

function isPrime(n){
  if ([2,3,5,7].includes(n)){return true}
  if (!(n%2)||!(n%2)||!(n%3)||!(n%5)){return false}
  const c=[4, 2, 4, 2, 4, 6, 2, 6]
  var p=7, i=0
  while (p*p<=n){
    if (!(n%p)){return false}
    p += c[i]
    i = (i+1)%8
  }
 return true
}
