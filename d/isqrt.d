//  isqrt hardware algorithm (original C code in `Hacker's delight` by H.S Wawrren Jr., Addison Wesley, 2013, 2nd ed., p. 286)
uint isqrt(uint n)
{
    uint m = 0x40000000, y = 0, b;
    while (m)
    {
        b = y | m;
        y >>= 1;
        if (n >= b)
        {
            n -= b;
            y |= m;
        }
        m >>= 2;
    }
    return y;
}




import std.math : pow, round, sqrt;

bool isSquare(uint n)
{
    return n == (cast(double) n).sqrt.round.pow(2);
}

uint isqrt(uint n)
{
    return cast(uint) (sqrt(cast(double)n) + 1e-9);
}
