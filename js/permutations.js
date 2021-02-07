// https://stackoverflow.com/questions/9960908/permutations-in-javascript
function permutations (arr,p=[],l=arr.length) {
  if (l==1) {p.push(arr.slice())}
  for (let i=0;i<l;i++) {
    permutations(arr,p,l-1)
    l%2?[arr[0],arr[l-1]]=[arr[l-1],arr[0]]:[arr[i],arr[l-1]]=[arr[l-1],arr[i]]
  }
  return p
}
