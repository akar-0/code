//sort array of strings by length
      sort(array.begin(), array.end(),  [](string const &a, string const &b) {return a.length() < b.length();});
