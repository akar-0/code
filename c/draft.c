https://www.codewars.com/kata/554ca54ffa7d91b236000023/train/c


#include <stdbool.h>
#include <stdlib.h>
#include <stdio.h>

// C returns a structure. Results are compared by way of strings. See "Examples" tab.
typedef long long ll;
// sz is array size.
typedef struct Data Data;
struct Data {
     ll* array;
     int sz;
};
bool is_prime(int n)
{
  if (n<2){return false;}
  if (n==2 || n==3 || n==5 || n==7){return true;}
  if (!(n%2)||!(n%3)||!(n%5)){return false;}
  int c[8]={4, 2, 4, 2, 4, 6, 2, 6};
  long p=7, i=0;
  while (p*p<=n){
    if ((n%p)==0){return false;}
    p += c[i];
    i = (i+1)%8;
  }
 return true;
}

Data* backwardsPrime(ll start, ll end) {
  ll* a=calloc(100,sizeof(ll));
  int k=0;
  for (ll n=start;n<=end;n++){
    if (is_prime(n)){
      ll m=n, o=0;
      while (m){
        o=o*10+(m%10);
        m/=10;
      }
      if (o!=n && is_prime(o)){
        printf("\n%lld-%lld\n",n,o);
        a[k]=n;
        k++;
      }
    }
  }
  struct Data o;
  o.array=calloc(100000,sizeof(ll));
  for (int i=0;i<k;i++){
    o.array[i]=a[i];
  }
  o.sz=k;
  return &o;
}
