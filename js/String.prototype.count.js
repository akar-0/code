String.prototype.count = function(c){
  return [...this].filter(x=>x===c).length
}
