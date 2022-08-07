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

ulong nextPrime(ulong n)
{
    ulong x;
    while (true)
    {
        auto s = cast(ulong) (cast(double) n).sqrt;
        for (x = 3 ; x <= s ; x += 2)
        {
            if (!(n %x))
            {
                n += 2;
                break;
            }
        }
        if (x > s) break;
    }
    return n;
}


// POWAAA

import  std.range : chain, drop, enumerate, iota, only, padLeft, repeat, retro, stride, take, zip;
import  std.algorithm.iteration : each, filter, fold, joiner, map, sum;
import  std.math : sqrt;
import  std.array : array;
    import std.range;
    import std.stdio: write, writeln, writef, writefln;
    import std.algorithm.comparison : equal;

static auto primes()
{
    // limit
    auto n = 20_000;
    auto c = (n%6)>1 ? 1 : 0;
    auto a = [n, n - 1, n + 4, n + 3, n + 2, n + 1];
    n = a[n%6];
    auto L = (true).repeat(n/3).array;
    L[0] = false;
    auto sq = cast(uint) sqrt(cast(double) n);
    for (auto i = 0 ; i <= sq / 3 ; i++)
    {
        if (L[i])
        {
            auto j=(3*i+1)|1;
            auto h=j*j;
            for (auto e = h / 3 ; e < L.length ; e += 2 *j)
            {
                L[e] = false;
            }
            for (auto e = (h+4*j-2*j*(i%2))/3 ; e < L.length ; e += 2 * j)
            {
                L[e] = false;
            }
        }
    }
    writeln(L.length);
 //   writeln(L);
    auto P = assumeSorted([2u,3].chain(iota(1, n/3-c).filter!(x => L[x]).map!(i => (3*i+1)|1)).array);
    return P;
}
