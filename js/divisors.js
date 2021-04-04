function divisors(n){
  const a=new Set([1,n])
  for (let k=2;k<=n/2;k++){
    if (n%k==0){
    a.add(k)
    a.add(n/k)
    }
  }
 return a
}
