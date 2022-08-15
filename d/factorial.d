import std.functional;

// https://dlang.org/library/std/functional/memoize.html
ulong fact(ulong n) @safe
{
    return n < 2 ? 1 : n * memoize!fact(n - 1);
}
