function fact(n){return n<2?1:n*fact(n-1)}
function c(n,k){return Math.round(f(k,n)/fact(n-k))}
function f(k,n){
  let o=1
  for (let i=k+1;i<=n;i++){
    o*=i
  }
  return o
}
