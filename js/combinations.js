// https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa/solutions/javascript
// https://www.codewars.com/kata/58ad29bc4b852b14a4000050/solutions/javascript
//a fignoler (renvoie des sommes)
function comb(arr,n){
  if (n==1) return arr
  let L=[]
  for (let i=0;i<arr.length-n+1;i++){
    for (const x of comb(arr.slice(i+1), n-1)){
      L.push([arr[i]].concat(x))
    }
  }
  return L
}
