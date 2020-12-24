function getMatrixProduct(a, b) {
   if (b.length!=a[0].length){return -1}
    var res=[]
    for (let i=0;i<a.length;i++){
        res.push([])
        for (let j=0;j<b[0].length;j++){
            var calc=0
            for (let k=0;k< a[0].length;k++){
                calc +=a[i][k]*b[k][j]
            }
            res[i].push(calc)
        }
    }
    return res
}
