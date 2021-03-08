function divisors(n){
  const a=new Set([1,n])
  for (let k=2;k<=n**5;k++){
    a.add(k)
    a.add(n/k)
  }
 return a
}
