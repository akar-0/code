//dict object
function counter(e){
 var C = {}
  for (const i of e){
    if (!C[i]){
      C[i] = 1
    }
    else {C[i]++}
  }
  return C
}

//on the fly
counter(n,arr){return arr.filter(e=>e==n).length}

//https://www.codewars.com/kata/reviews/59106fc3c37bca02fc000981/groups/5f80d9ed86498900011ee79d
const cnt=a=>a.reduce((o,n)=>(o[n]=o[n]+1||1,o), {});
