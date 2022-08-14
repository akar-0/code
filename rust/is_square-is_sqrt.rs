    let is_square = |n| n == ((n as f64).sqrt().round() as u32).pow(2);
    let isqrt = |n| ((n as f64).sqrt() + 1e-9) as u32;
