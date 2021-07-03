std::string center(std::string s, size_t l){
  size_t m=(l-s.length())>>1;
  string pad=string(m, ' ');
  return s+pad+s;
}
