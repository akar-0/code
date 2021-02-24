bool isPrime(int n)
{
  int i=2;
  if (n<=1){
    return false;
  }
  for (i=2;i<=pow(n, 0.5);i++){
    if (n%i == 0)
    {
      return false;
    }
  }
   return true;
}

#include <vector>
#include <numeric>


using namespace std;

bool isPrime(int n){
  if (n<2){return false;}
  if (n==2||n==3||n==5||n==5){return true;}
  if (!(n%2)||!(n%3)||!(n%5)){return false;}
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

int nextPrime(int n){
 if (n <2){return 2;}
  if (n==2){return 3;}
  if (!(n%2)){n++;}
  else {n+=2;}
  while (1){
    if (isPrime(n)){return n;}
    else {n+=2;}}
}
