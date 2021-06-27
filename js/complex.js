// https://www.codewars.com/kata/5a981424373c2e479c00017f/solutions/javascript


class Complex {
  constructor(r,i){
    this.real=r
    this.im=i||0
  }
  toString(){
    return `${this.real?this.real:''}${this.im>0?'+':''}${this.im?(this.im==1?'':this.im==-1?'-':this.im)+'i':''}`.replace(/^\+/,'')||'0'
  }
  add(o){
    return new Complex(this.real+o.real,this.im+o.im)
  }
}
const parse=(b,s=b.replace('-i','-1').replace('+i', '+1').replace(/i/,''))=>{
    if (!s) return new Complex(0,1)
    if (!b.includes('i')) return new Complex(+b)
    const a=s.match(/(\+?\d+|-?\d+)/g)
    return a.length==2? new Complex(+a[0],+a[1]) : new Complex(0,+a[0])
  }
