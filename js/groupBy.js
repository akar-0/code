function groupBy(L){
  const res=[]
  let i=0
  while (i<L.length){
    const n=L[i], tmp=[n,[n]]
    while (L[i+1]===n){
      i++
      tmp[1].push(n)
    }
    res.push(tmp)
    i++
  }
 return res
}
function groupBy(L){
  const res=[]
  let i=0
  while (i<L.length){
    const n=L[i], tmp=[n]
    while (L[i+1]===n){
      i++
      tmp.push(n)
    }
    res.push([n,tmp.join('')])
    i++
  }
 return res
}

function groupBy(L){
  const res=[]
  let i=0
  while (i<L.length){
    const n=L[i]
    let c=1
    while (L[i+1]===n){
      i++
      c++
    }
    res.push([n,c])
    i++
  }
 return res
}
