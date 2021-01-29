fn count_sheep(n: u32) -> String {
  let mut s: String = "".to_owned();
  for i in 1..(n+1) {
    s=format!("{}{} sheep...", s, i);
  }
  s
}
