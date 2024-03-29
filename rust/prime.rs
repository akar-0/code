use std::collections::HashMap;

fn factors(n: i32) -> HashMap<i32, i32> {
    let mut arr = Vec::new();
    let mut count: HashMap<i32, i32> = HashMap::new();
    let c = [4, 2, 4, 2, 4, 6, 2, 6];
    let mut m=n;
    let mut p=7;
    let mut i=0;
    while m%2 == 0 {
      arr.push(2);
      m /= 2;
    }
    while m%3 == 0 {
      arr.push(3);
      m /= 3;
    }
    while m%5 == 0 {
      arr.push(5);
      m /= 5;
    }
    while m != 1 || p*p <= n {
        while m%p == 0 {
            arr.push(p);
            m/=p;
        }
        p += c[i];
        i = (i+1)%8;
    }
    if m > 1 {arr.push(m);}
    for x in arr.to_owned().iter() {
        *count.entry(*x).or_insert(0) += 1;
    }
    count
}

    
    
fn is_prime(x: i64) -> bool {
    if x ==2 || x==3 || x == 5 || x == 7 {return true;}
    if x < 2 || x%2 == 0 {return false;}
    let mut i = 3;
    while i*i <= x {
        if x%i == 0 {return false;}
        else {i += 2;}
    }
    true
}


fn count_factors(n: i32) -> i32 {
    if n == 0 {
        return 0
    }
    if n < 2 {
        return 1
    }
    let mut o=0;
    let s=(n as f64).sqrt() as i32;
    let c = [4, 2, 4, 2, 4, 6, 2, 6];
    let mut m=n;
    let mut p=7;
    let mut i=0;
    while m%2 == 0 {
      o+=1;
      m /= 2;
    }
    while m%3 == 0 {
      o+=1;
      m /= 3;
    }
    while m%5 == 0 {
      o+=1;
      m /= 5;
    }
    while m != 1 || p <= s {
        while m%p == 0 {
            o+=1;
            m/=p;
        }
        p += c[i];
        i = (i+1)%8;
    }
    if m > 1 {o+=1;}
    o
}

fn is_prime(x: i32) -> bool {
    if x<2 {return false;}
    if x ==2 || x==3 || x == 5 || x == 7 {return true;}
    if x%2==0 || x%3==0 || x%5==0 {return false;}
    let c = [4, 2, 4, 2, 4, 6, 2, 6];
    let mut p = 7;
    let mut i=0;
    let s=(x as f64).sqrt() as i32;
    while p <= s {
        if x%p == 0 {return false;}
        else {p += c[i];}
        i = (i+1)%8;
    }
    true
}

fn next_prime(m: u32) -> u32 {
    let mut n=m;
  if n == 0 || n == 1 {return 2_u32;}
  if n%2==0 {n += 1;}
  else {n+=2;}
  while n>0 {
    if isPrime(n) {return n;}
    else {n += 2;}
    }
  1_u32
}



use std::collections::HashSet;
use lazy_static::lazy_static;

lazy_static! {
    static ref PRIMES_VEC: Vec<u32> = {
        let mut n = 30_000;
        let c = if (n % 6) > 1 { 1 } else { 0 };
        let a = [n, n - 1, n + 4, n + 3, n + 2, n + 1];
        n = a[(n%6) as usize];
        let mut ls = std::iter::repeat(true).take(n/3).collect::<Vec<_>>();
        ls[0] = false;
        let sq = (n as f64).sqrt() as usize;
        let l = ls.len();
        for i in 0..=sq/3 {
            if ls[i] {
                let j=(3*i+1)|1;
                let h = j * j;
                for e in (h/3..l).step_by(2 * j) {
                    ls[e] = false;
                }
                for e in ((h+4*j-2*j*(i%2))/3..l).step_by(2*j) {
                    ls[e] = false;
                }
            }
        }
        return [2u32,3u32]
        .iter().copied().chain(
            (1..n/3-c)
            .filter(|&x| ls[x])
            .map(|i|  (3 * i as u32 + 1) | 1)
        ).collect()
    };
    static ref PRIMES_SET: HashSet<u32> = PRIMES_VEC.iter().copied().collect();
}



fn next_prime(n: u64) -> u64 {
    (n+1..).find(|x| is_prime(*x)).unwrap()
}

fn is_prime(x: u64) -> bool {
    x == 2 || x == 3 || x > 2 && x%2 != 0 && (3..(x as f64).sqrt().round() as u64).step_by(2).all(|n| x % n != 0)
}
