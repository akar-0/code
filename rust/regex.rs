use once_cell::sync::Lazy;
use regex::Regex;

fn ... {
    static RE: Lazy<Regex> = Lazy::new(|| Regex::new("REGEX").unwrap());
}
// https://docs.rs/regex/1.1.0/regex/struct.Regex.html#method.replace_all
// backrefs:
// https://www.codewars.com/kata/5b049d57de4c7f6a6c0001d7/solutions/rust

// https://www.codewars.com/kata/5a420163b6cfd7cde5000077/solutions/rust
// pseudo back refs
// https://www.codewars.com/kata/58708934a44cfccca60000c4/solutions/rust
// iter over matches
// https://www.codewars.com/kumite/6298512bd747b9002f4eb5dd?sel=6298512bd747b9002f4eb5dd
// named groups
// https://www.codewars.com/kumite/629a327dbd528d39da601a04?sel=629a327dbd528d39da601a04


// Unnamed...
use fancy_regex::Regex;
use once_cell::sync::OnceCell;

//   https://www.codewars.com/kata/reviews/62dbfe4492f0ac0001901e33/groups/62dc135292f0ac00019023a0
