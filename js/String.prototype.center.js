String.prototype.center = function(l){
  const m=(l-this.length)>>1, s=' '.repeat(m)
  return s+this+s
}
