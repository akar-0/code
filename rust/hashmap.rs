// https://leetcode.com/problems/group-anagrams/submissions/



use std::collections::HashMap;

impl Solution {
    pub fn group_anagrams(strs: Vec<String>) -> Vec<Vec<String>> {
        let mut d:HashMap::<String,Vec<String>> = HashMap::new();
        let mut o:Vec<Vec<String>> = vec![];
        for s in strs.iter() {
            let mut chars: Vec<char> = s.chars().collect();
            chars.sort_by(|a, b| b.cmp(a));
            let k:String = chars.into_iter().collect();
            if d.contains_key(&k) {
                let mut v:Vec<String> = (*d[&k]).to_vec();
                v.push(s.to_string());
                d.insert(k, v);
            } else {
                d.insert(k, vec![s.to_string()]);
            }
        }
        for (k, v) in &d {
            o.push(v.to_vec())
        }
       o
    }
}
