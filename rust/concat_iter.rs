// https://www.codewars.com/kumite/62cbdda9d32bd6183bd511c5?sel=62cbdda9d32bd6183bd511c5


    fn f(l: usize, a: i32, b: i32) -> String {
        (a..=a.max(b - 1)).chain((a + 1..=b).rev()).cycle()
        .flat_map(int_into_char_iter)
        .take(if a > b { 0 } else { l })
        .collect()
    }

    // Thanks to veber-alex from https://discord.com/channels/273534239310479360/@home
    fn int_into_char_iter(m: i32) -> impl Iterator<Item = char> {
        let mut sign = m < 0;
        let mut n = m.abs() as u32;
        let mut div = 10_u32.pow((n as f64).log10().floor() as u32);
        std::iter::from_fn(move || {
            if sign {
                sign = false;
                Some('-')
            } else if div == 0 {
                None
            } else {
                let v = n / div;
                n %= div;
                div /= 10;
                Some((v as u8 + 48) as char)
            }
        })
    }
