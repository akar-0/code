// https://stackoverflow.com/questions/64178272/what-is-the-idiomatic-rust-way-to-build-a-hashmap-of-character-counts
// https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/solutions/rust 
// https://www.codewars.com/kata/585a033e3a36cdc50a00011c/solutions/rust !!!!!!!!!!!!
// cf alphabetic anagrams
use std::collections::HashMap;

    let mut a: HashMap<char, i32> = HashMap::new();
    for c in s.to_owned().iter() {
        *a.entry(*c).or_insert(0) += 1;
        // decrement
        a.entry(c).and_modify(|c| *c -= 1);
        *counter.get_mut(&c).unwrap() -= 1;
    }



s.matches(c).count()
