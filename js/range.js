Array.from(range(min, max))
function *rg(a, b, step=1) {for (var i = Math.min(a,b); i < Math.max(a,b); i+=step) yield i}
