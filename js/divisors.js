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
// count divisors
  let h=0
  for (let k=1;k<=n**.5;k++){
    if (n%k==0){
      if (n/k==k) h++
      else h+=2
    }
  }
return h
// plus rapide : https://www.geeksforgeeks.org/count-divisors-n-on13/
//check aussi :
// https://www.codewars.com/kata/59dc6a967905dfb7530000aa/solutions/javascript
