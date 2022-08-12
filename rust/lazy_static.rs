// https://www.codewars.com/kumite/62d41b9fd32b8c005817ee33?sel=62d41b9fd32b8c005817ee33
// https://www.codewars.com/kumite/62d43b2fc346e300147e537a?sel=62d43b2fc346e300147e537a



use std::collections::HashSet;
use lazy_static::lazy_static;

lazy_static! {
    static ref H: HashSet<char> = {
        "aeiouAEIOU".chars().collect()
    };
}

