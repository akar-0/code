fn factors(n: u32) -> Vec<u32> {
    let mut arr = vec![1];
    let mut m = n;
    let isq =(n as f64).sqrt().floor() as u32;
    let mut p = 2;
    while m != 1 || p < isq {
        let (mut q, mut r) = divmod(m, p);
        if r == 0 {
            arr.push(p);
            while r == 0 {
                m = q;
                (q, r) = divmod(m, p);
            }
        }
        p += if p == 2 { 1 } else { 2 };
    }
    if m > 1 { arr.push(n) }
    arr
}
