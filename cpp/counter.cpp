//see https://www.codewars.com/kata/5270d0d18625160ada0000e4/solutions/cpp  
unsigned c[size] = {};
  for (auto d : iterable)
    c[d]++;

//https://www.codewars.com/kata/554ca54ffa7d91b236000023/solutions/cpp

#include <unordered_map>
  std::unordered_map<int, unsigned> count;
  for (int k: arr) count[k]++;
