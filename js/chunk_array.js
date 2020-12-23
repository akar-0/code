function chunk(arr, step){
  var tmp=arr.slice()
  var res=[]
  if (step<0){
    tmp.reverse();
    step=Math.abs(step);
  }
  for (let i=0;i<tmp.length;i += step)
    {
      res.push(tmp[i]);
    }
  return res;
}
