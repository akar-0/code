
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



