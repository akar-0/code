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
