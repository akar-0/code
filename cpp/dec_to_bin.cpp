std::string decToBin(int n){
  return n==0?"0":n==1?"1":decToBin(n>>1)+std::to_string(n&1);
}
// https://www.codewars.com/kata/551f37452ff852b7bd000139/solutions/cpp !!!!
