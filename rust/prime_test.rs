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
