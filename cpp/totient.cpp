#include <vector>
#include <bits/stdc++.h> 


std::unordered_set<int> primeFactors(int n){
  std::unordered_set<int> S;
  int m=n,p;
  const std::set<int> a={2,3,5};
  for (auto p: a){ 
        while (!(m%p)){
          m /= p;
          S.insert(p);
        }
  }
  p=7;
  int i=0;
  const std::vector<int> c={4, 2, 4, 2, 4, 6, 2, 6};
  while (m != 1 || p*p<n){
        while (!(m%p)){
          m /= p;
          S.insert(p);
        }
    p += c[i];
    i = (i+1)%8;
  }
  if (m>1){S.insert(n);}
  return S;
}
int eulersTotientFunction (int n){
  if (n==1){return 1;}
  int p=0;
  for (auto p:primeFactors(n)){
    n -=n/p;
  }
  return n;
}
