// https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa/solutions/javascript
//a fignoler (renvoie des sommes)
function comb(arr,n){
  if (n==1) return arr
  let L=[]
  for (let i=0;i<arr.length-n+1;i++){
    L=L.concat(comb(arr.slice(i+1), n-1).map(x=>x+arr[i]))
  }
  return L
}
