bool isPrime(long n)
{
  if (n < 2) return false;
  if (n==2||n==3||n==5||n==7){return true;}
  if (!(n%2)||!(n%3)||!(n%5)||!(n%7)){return false;}
  auto c = [4, 2, 4, 2, 4, 6, 2, 6];
  int p=7, i=0;
  while (p*p<=n)
    {
    if (!(n%p)){return false;}
    p+=c[i];
    i=(i+1)%8;
  }
 return true;
}
