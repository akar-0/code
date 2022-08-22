
import std.bigint, std.math, std.functional;


BigInt fibmemo(BigInt n)
{
    return n < 2 ? n : memoize!(fibmemo, 2_000_000)(n - 2) + memoize!(fibmemo, 2_000_000)(n - 1);
}

BigInt fib(int n)
{
     if (n < 0) return pow(-1, (n&1) + 1) * fib(-n);
    return fibmemo(BigInt(n));
}


BigInt[int] memo;

export BigInt fib(int n)
{
    if (n < 0) return pow(-1, (n&1) + 1) * fib(-n);
    BigInt a = 1, b = 1, x = 1, c, y, q, r, s;
    while (n)
    {
        if (n&1) {
            q = a * x + b * y;
            y = b * x + c * y;
            x = q;
            n--;
        } else {
            q = a * a + b * b;
            r = a * b + b * c;
            c = b * b + c * c;
            a = q;
            b = r;
            n >>= 1;
        }
    }
    return y;
}
