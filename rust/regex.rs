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

fn f(x: &[[char; 8]; 8]) -> bool {
    static S_RE: &str = "[♛♜] *♔|♔ *[♛♜]|[♛♜](.{8} )*.{8}♔|♔(.{8} )*.{8}[♛♜]|[♛♝]((?!n).{9} )*(?!n).{9}♔|[♛♝]((?<!n.).{7} )*(?<!n).{7}♔|♔((?!n).{9} )*(?!n).{9}[♛♝]|♔((?<!n.).{7} )*(?<!n).{7}[♛♝]|♟(?!n).{9}♔|♟(?<!n.).{7}♔|♞(?!n).{18}♔|♞(?<!n.).{16}♔|♞(?!n|.n).{10}♔|♞(?<!n.|n..)(?![^n]{6}).{6}♔|♔(?<!n.|n..)(?![^n]{6}).{6}♞|♔(?!n|.n).{10}♞|♔(?<!n.).{16}♞|♔(?!n).{18}♞";
    static RE: OnceCell<Regex> = OnceCell::new();
    let s: String = x.join(&'n').into_iter().collect();
    RE.get_or_init(|| Regex::new(S_RE).unwrap()).is_match(&s).unwrap()
}
