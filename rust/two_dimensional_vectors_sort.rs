    use itertools::Itertools;
    use std::cmp::Ordering;
    use super::power;
    use core::iter::zip;
        
    fn f(a: &[u32], b: &[u32]) -> Ordering {
        for (x, y) in zip(a, b) {
            if x != y {
                return x.cmp(&y)
            }
        }
        return a.len().cmp(&b.len())
    }
    
    fn dotest(a: &[u32], expected: &[Vec<u32>]) {
        let actual = power(a);
        assert!(
            actual
            .iter()
            .map(|x| x.iter().sorted().copied().collect::<Vec<_>>())
            .collect::<Vec<_>>()
            .iter()
            .sorted_by(|a, b| f(&a, &b))
            .eq(expected
                .iter()
                .map(|x| x.iter().sorted().copied().collect::<Vec<_>>())
                .collect::<Vec<_>>()
                .iter()
                .sorted_by(|a, b| f(a, b))
            ),
            "With a = {a:?}\nExpected {expected:?} but got {actual:?}")
    }
