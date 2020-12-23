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
