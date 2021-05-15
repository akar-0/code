function shuffleArray(a){
  let c=a.length, b, i
  while (c){
    i=Math.floor(Math.random()*c--)
    b=a[c]
    a[c]=a[i]
    a[i]=b
  }
  return a
}
