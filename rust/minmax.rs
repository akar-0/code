// https://www.codewars.com/kumite/62924489b5ee6a23c19e516b?sel=62924489b5ee6a23c19e516b
// https://docs.rs/itertools/0.7.8/itertools/trait.Itertools.html#method.minmax
// https://www.codewars.com/kumite/6295cd8afc636500631814d5?sel=6295cd8afc636500631814d5

use itertools::Itertools;
use itertools::MinMaxResult::{MinMax, OneElement};


    match xs.iter().minmax() {
        MinMax(x, y) => Some((*x, *y)),
        OneElement(x) => Some((*x, *x)),
        _ => None
    }
