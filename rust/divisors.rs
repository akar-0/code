fn count_div(n: u32) -> u8 {
    let s = (n as f64).sqrt() as u32;
    2 * (1..=s).filter(|x| n % x == 0).count() as u8 - if n == s * s {1} else {0}
}
