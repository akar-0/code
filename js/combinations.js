// https://www.codewars.com/kata/55e7280b40e1c4a06d0000aa/solutions/javascript
// https://www.codewars.com/kata/58ad29bc4b852b14a4000050/solutions/javascript
function comb(arr,n){
  if (n==1) return arr
  const L=[]
  for (let i=0;i<arr.length-n+1;i++){
    for (const x of comb(arr.slice(i+1), n-1)){
      L.push([arr[i]].concat(x))
    }
  }
  return L
}
// combinations with replacement
function comb(arr,n){
  if (n==1) return arr
  let L=[]
  for (let i=0;i<arr.length-n+2;i++){
    for (const x of comb(arr.slice(i), n-1)){
      L.push([arr[i]].concat(x))
    }
  }
  return L
}


function prod(arr,n){
  if (n==1) return arr.map(e=>[e])
  const L=[]
  for (const e of arr){
    for (const x of prod(arr, n-1)){
      L.push([e].concat(x))
    }
  }
  return L
}
