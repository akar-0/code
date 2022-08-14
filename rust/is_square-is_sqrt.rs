    let is_square = |n| n == ((n as f64).sqrt().round() as u32).pow(2);
    let isqrt = |n| ((n as f64).sqrt() + 1e-9) as u32;

fn is_square(n: u32) -> bool {
    n == ((n as f64).sqrt().round() as u32).pow(2)
} 

    use num::integer::Roots;

fn isqrt(n: u32) -> u32 {
    n.nth_root(2)
}


fn is_square(n: u32) -> bool {
    n == n.nth_root(2).pow(2)
} 
