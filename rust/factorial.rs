fn factorial(n: u32) -> BigUint {
    (2..=n).fold(BigUint::one(), |acc, curr| acc * curr.to_biguint().unwrap().clone())
}
