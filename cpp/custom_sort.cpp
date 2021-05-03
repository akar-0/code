// https://www.codewars.com/kata/57ea5b0b75ae11d1e800006c/solutions/cpp
//sort array of strings by length
      sort(array.begin(), array.end(),  [](string const &a, string const &b) {return a.length() < b.length();});
