// See also https://www.codewars.com/kata/reviews/57cb12de35ef62f92d000141/groups/57cb21fd58da9ee0d7000071
//dict object
function counter(e){
  const C = {}
  for (const i of e) C[i]=(C[i]||0)+1
  return C
}
const counter = require('lodash').countBy;
//on the fly
counter(n,arr){return arr.filter(e=>e==n).length}

//https://www.codewars.com/kata/reviews/59106fc3c37bca02fc000981/groups/5f80d9ed86498900011ee79d
const cnt=a=>a.reduce((o,n)=>(o[n]=o[n]+1||1,o), {});
