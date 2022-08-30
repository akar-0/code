
import std.container.rbtree, std.math, std.array, std.algorithm, std.range;

auto getDivisors(uint num)
{
    return (1).only
           .chain(num.only)
           .chain(
                iota(2, cast(uint) (cast(double) num).sqrt + 1)
                .filter!(n => ! (num%n))
                .map!(n => [n, num / n]).joiner
            ).array.redBlackTree!uint;
}



uint countDivisors(uint num)
{
    auto sq = sqrt(cast(double) num);
    return 2 * iota(2, cast(uint) sq + 1).fold!((acc, cur) => acc + !(num%cur))(1) - !(sq % 1.0);
}


int[int] factors(int n)
{
    int[] arr;
    int[int] count;
    auto c = [4, 2, 4, 2, 4, 6, 2, 6], m = n, p = 7, i = 0;
    while (m%2 == 0) {
      arr ~= 2;
      m /= 2;
    }
    while (m%3 == 0) {
      arr ~= 3;
      m /= 3;
    }
    while (m%5 == 0) {
      arr ~= 5;
      m /= 5;
    }
    while (m != 1 || p*p <= n) {
        while (m%p == 0) {
            arr ~= p;
            m /= p;
        }
        p += c[i];
        i = (i+1)%8;
    }
    if (m > 1) arr ~= m;
    foreach(x; arr) count[x]++;
    return count;
}
