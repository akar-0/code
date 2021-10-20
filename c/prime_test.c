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
