// sum by factors
// https://www.codewars.com/kata/54d496788776e49e6b00052f/solutions/c
#include <stdbool.h>
#include <math.h>

bool is_prime(int n)
{
  int i=2;
  if (n<=1){
    return false;
  }
  if (n ==2){
    return true;
  }
  for (i=2;i<=pow(n, 0.5)+1;i++){
    if (n%i == 0)
    {
      return false;
    }
  }
   return true;
}
// gap in primes
// https://www.codewars.com/kata/561e9c843a2ef5a40c0000a4/solutions/c
int isPrime(long long n){
  if (n<2) return 0;
  if (n==2||n==3||n==5||n==7) return 1;
  if (!(n%2)||!(n%3)||!(n%5)) return 0;
  long long c[8]={4, 2, 4, 2, 4, 6, 2, 6};
  long long p=7;
  unsigned i=0;
  while (p*p<=n){
    if (!(n%p)) return 0;
    p+=c[i];
    i=(i+1)%8;
  }
  return 1;
}
long long nextPrime(long long n){
  if (n<2) return 2;
  if (!(n&1)) n++;
  else n+=2;
  while (1){
    if (isPrime(n)) return n;
    n+=2;
  }
}
