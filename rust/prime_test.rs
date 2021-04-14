fn is_prime(x: i64) -> bool {
    if x ==2 || x==3 || x == 5 || x == 7 {return true;}
    if x < 2 || x%2 == 0 {return false;}
    let mut i = 3;
    while i*i <= x {
        if x%i == 0 {return false;}
        else {i += 2;}
    }
    return true;
}


fn is_prime(x: u64) -> bool {
    if x<2 {return false;}
    if x ==2 || x==3 || x == 5 || x == 7 {return true;}
    if x%2==0 || x%3==0 || x%5==0 {return false;}
    let c = [4, 2, 4, 2, 4, 6, 2, 6];
    let mut p = 7;
    let mut i=0;
    while p*p <= x {
        if x%p == 0 {return false;}
        else {p += c[i];}
        i = (i+1)%8;
    }
    return true;
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
  return 1_u32
}
