import std.functional;

// https://dlang.org/library/std/functional/memoize.html
ulong fact(ulong n) @safe
{
    return n < 2 ? 1 : n * memoize!fact(n - 1);
}

import std.bigint, std.conv, std.range, std.algorithm, std.array;

BigInt factorial(ulong n)
{
    return iota(2, n+1).fold!((acc, cur) => acc * cur.to!BigInt)(BigInt(1));
}



BigInt factorial(ulong n) @safe
{
    return n < 2 ? BigInt(1) : BigInt(n) * memoize!factorial(n - 1);
}
