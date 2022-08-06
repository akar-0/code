// cartesianProduct of a same range n times
uint[] prod(uint n)
{
    static uint[] r = [1,2,3,4,5,6];
    if (n == 1) return r;
    uint[] o;
    foreach(h;prod(n-1))
    {
        foreach(m;r)
        {
            o ~= h + m;
        }
    }
    return o;
}
