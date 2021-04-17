string trim(string s, string sep=" "){
  string o=s.substr(s.find_first_not_of(sep),string::npos);
  return o.substr(0,o.find_last_not_of(sep)+1);
}
