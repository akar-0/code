using namespace std;


#include <unordered_map>
#include <vector>
#include <cmath>

using namespace std;
unordered_map<int,unsigned> factors(int n) {
  vector<int> arr;
  unordered_map<int, unsigned> count;
 // if (n<2) {return unordered_map<int, unsigned>();}
  int m=n, p=7, i=0;
  while (m%2 == 0){
    arr.push_back(2);
    m /= 2;
  }
  while (m%3 == 0){
    arr.push_back(3);
    m /= 3;
  }
  while (m%5 == 0){
    arr.push_back(5);
    m /= 5;
  }
  vector<int> c={4, 2, 4, 2, 4, 6, 2, 6};
  while (m!=1 || p*p<=n) {
    while (!(m%p)){
      m/=p;
    arr.push_back(p);
    }
    p+=c[i];
    i=(i+1)%8;
  }
  if (m>1) {arr.push_back(n);}
  for (int k: arr) {count[k]++;}
  return count;
}




std::vector<int> prime_factors(long n){
  if (isPrime(n)) //A FINIR
  vector< int > arr;
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
bool isPrime(int n){
  if (n<2){return false;}
  if (n==2||n==3||n==5||n==7){return true;}
  if (!(n%2)||!(n%3)||!(n%5)||!(n%7)){return false;}
  vector<int> c={4, 2, 4, 2, 4, 6, 2, 6};
  int p=7, i=0;
  while (p*p<=n)
    {
    if (!(n%p)){return false;}
    p+=c[i];
    i=(i+1)%8;
  }
 return true;
}
