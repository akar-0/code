fn center_string(s: &str, l: usize) -> String {
    let m = (l - s.len()) / 2;
    let e = " ".repeat(m);
    format!("{}{}{}", e, s, e)
}

