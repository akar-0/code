
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
