//https://www.codewars.com/kata/5a1d86dbba2a142e040000ee/solutions
// https://stackoverflow.com/questions/9960908/permutations-in-javascript
// https://www.codewars.com/kata/5865a407b359c45982000036/solutions/javascript
// https://www.codewars.com/kata/5254ca2719453dcc0b00027d/solutions
// https://www.codewars.com/kata/56b18992240660a97c00000a/solutions/javascript
// heap algorithm
function permutations (arr, l=arr.length, p=[]) {
  if (l==1) {p.push(arr.slice())}
  for (let i = 0; i < l ;i++) {
    permutations(arr,l-1,p)
    l%2 ? [arr[0] ,arr[l-1]] = [arr[l-1], arr[0]] : [arr[i], arr[l-1]] = [arr[l-1], arr[i]]
  }
  return p
}

// https://stackoverflow.com/questions/9960908/permutations-in-javascript/37580979#37580979
function permutations(a,l=a.length) {
  const L = [a.slice()],
      c =Array(l).fill(0)
  let i = 1, k, p
  while (i<l){
    if (c[i] < i) {
      k=i&1 && c[i]
      p=a[i]
      a[i]=a[k]
      a[k]=p
      c[i]++
      i=1
      L.push(a.slice())
    } else {
      c[i] = 0
      i++
    }
  }
  return L
}




function allPermutations(arr) {
  const perm = permutations(arr), res = []
  for (let i = 1 ; i <= arr.length ; i++) {
    perm.forEach(p => res.push(p.slice(0,i)));
  }
  return res;
}

// yield

https://www.codewars.com/kata/reviews/62f2177ffea8610001361509/groups/62f24a85e9e51f0001689603
