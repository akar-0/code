var Queue = function() {
  this.a = []
};

Queue.prototype.enqueue = function(item) {
  this.a.push(item)
};

Queue.prototype.dequeue = function() {
  const e=this.a.shift()
  return e
};

Queue.prototype.size = function() {
  return this.a.length
};
