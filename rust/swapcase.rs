fn swapcase(c: char) -> char {
    if c.is_lowercase() {
        c.to_uppercase().next().unwrap()
    } else {
        c.to_lowercase().next().unwrap()
    }
}
