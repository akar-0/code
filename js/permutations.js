//https://www.codewars.com/kata/5a1d86dbba2a142e040000ee/solutions
// https://stackoverflow.com/questions/9960908/permutations-in-javascript
// https://www.codewars.com/kata/5865a407b359c45982000036/solutions/javascript
// https://www.codewars.com/kata/5254ca2719453dcc0b00027d/solutions
// https://www.codewars.com/kata/56b18992240660a97c00000a/solutions/javascript
function permutations (arr,l=arr.length,p=[]) {
  if (l==1) {p.push(arr.slice())}
  for (let i=0;i<l;i++) {
    permutations(arr,l-1,p)
    l%2?[arr[0],arr[l-1]]=[arr[l-1],arr[0]]:[arr[i],arr[l-1]]=[arr[l-1],arr[i]]
  }
  return p
}
