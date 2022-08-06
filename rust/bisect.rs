fn bisect(m: f64, xs: &[f64]) -> usize {
    let mut lo = 0;
    let mut hi = xs.len();
    let mut mid;
    while lo < hi {
        mid = (lo + hi) / 2;
        match m.partial_cmp(&xs[mid]).unwrap() {
            Ordering::Equal => return mid,
            Ordering::Less => hi = mid,
            _ => lo = mid + 1,
        }
    }
    lo
}


fn bisect(m: u32) -> usize {
    let mut lo = 0;
    let mut hi = L.len();
    let mut mid;
    while lo < hi {
        mid = (lo + hi) / 2;
        if m == L[mid] {
            return mid;
        } else if m < L[mid] {
            hi = mid;
        } else {
            lo = mid + 1;
        }
    }
    lo
}
