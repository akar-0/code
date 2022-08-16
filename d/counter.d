uint[dchar] counter(string s)
{
    uint[dchar] res;
    s.representation.each!(x => res[x]++);
    return res;
}

