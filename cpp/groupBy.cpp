// https://en.cppreference.com/w/cpp/algorithm/unique


  vector<pair<char, size_t>> groupBy(string s){
    vector<pair<char, size_t>> v;
    size_t i=0, l=s.length();
    while (i<l){
      char n=s[i];
      size_t c=1;
      while (i+1<l && s[i+1]==n){
        i++;
        c++;
      }
      v.push_back(make_pair(n,c));
      i++;
    }
    return v;
  }
