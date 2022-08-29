ulong[][] combinationsWithReplacement(ulong[] arr, ulong n)
{
    if (n == 1) return arr.map!(x => [x]).array;
    ulong[][] res;
    foreach(t; arr.enumerate)
    {
        auto i = t.index, e = t.value;
        foreach(x;combinationsWithReplacement(arr[i .. $], n-1))
        {
            res ~= ([e] ~ x);
        }
    }
    return res;
}


int[2][][] combinations(int[2][] arr, ulong n)
{
    if (n == 1) return arr.map!(x => [x]).array;
    int[2][][] res;
    foreach(t; arr.enumerate)
    {
        auto i = t.index, e = t.value;
        foreach(x;combinations(arr[i + 1 .. $], n-1))
        {
            res ~= ([e] ~ x);
        }
    }
    return res;
}




ubyte[][] allPermutations(ubyte[] s)
{
    auto perm = s.permutations;
    ubyte[][] res;
    foreach(i; 1 .. s.length + 1)
    {
        foreach(p; perm)
        {
            res ~= p[0 .. i].array;
        }
    }
    return res;
}


uint[][] combinations(const uint[] arr, ulong n)
{
    if (!n) return [null];
    if (n == 1) return arr.dup.map!(x => [x]).array;
    uint[][] res;
    foreach(t; arr.enumerate)
    {
        auto i = t.index, e = t.value;
        foreach(x;combinations(arr[i + 1 .. $], n-1))
        {
            res ~= ([e] ~ x);
        }
    }
    return res;
}


int[] comb(int[] arr, int n) {
    if (n==1) return arr;
    int[] o;
    for (int i = 0 ; i < cast(int)arr.length - n + 1 ; i++) {
        int h = arr[i];
        foreach(x;comb(arr[i+1..$], n - 1)) { o ~= x + h;}
    }
    return o;
}
