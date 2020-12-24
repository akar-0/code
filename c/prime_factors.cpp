std::vector<int> prime_factors(long n){
  std::vector< int > arr;
  int p=3;
  if (n<2){
    return arr;
  }
  while (n%2 == 0){
    arr.push_back(2);
    n /= 2;
  }
  while (n%3 == 0){
    arr.push_back(3);
    n /= 3;
  } 
  while (p*p<=n){
    while (n % p == 0){
      arr.push_back(p);
      n /= p;
    }
    p += 2;
  }
  if (n != 1){arr.push_back(n);}
  return arr;
}
