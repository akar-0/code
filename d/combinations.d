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
