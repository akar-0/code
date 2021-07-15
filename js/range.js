Array.from(range(min, max))
function *range(a, b, step=1) {for (let i=Math.min(a,b); i< Math.max(a,b); i+=step) yield i}
