std::string decToBin(int n){
  return n==0?"0":n==1?"1":decToBin(n>>1)+std::to_string(n&1);
}
bitset<32>(n).to_string();
// https://www.codewars.com/kata/551f37452ff852b7bd000139/solutions/cpp !!!!
// https://www.codewars.com/kata/5959ec605595565f5c00002b/solutions/cpp
//https://www.codewars.com/kata/5f3afc40b24f090028233490/solutions/cpp
