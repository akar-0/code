// a finir
    let mut v=vec![......];
    let l=v.len();
    let mut o="".to_owned();
    let mut i=0;
    while i<v.len() {
        let n=v[i];
        let mut c=1;
        while i+1<l && v[i+1]==n {
            i+=1;
            c+=1;
        }
        if (c&1)==1 {o.push(n)}
        i+=1;
    }
    if o==s {return o}
    doubles(&o)
}
// https://www.codewars.com/kata/55eeddff3f64c954c2000059/solutions/rust
// https://www.codewars.com/kata/586d6cefbcc21eed7a001155/solutions/rust
use itertools::Itertools;
...
// dedup_with_count
// https://www.codewars.com/kata/546dba39fa8da224e8000467/solutions/rust
// https://www.codewars.com/kata/5263c5d011f4233c9d000561/solutions/rust
fn group_by(s: &str) -> String {
    let mut o:Vec<String> = Vec::new();
    let l=s.len();
    let mut i=0;
    while i < l {
        let n=s.chars().nth(i).unwrap();
        let mut c=1;
        while i+1 < l && s.chars().nth(i+1).unwrap() == n {
            i+=1;
            c+=1;
        }
        o.push(format!("{}{}", c, n));
        i+=1;
    }
    o.join("")
}
