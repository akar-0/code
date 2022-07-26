long reverseInt(long n) {
    long m = 0, r;
    for (; n; n /= 10){
        r = n % 10;
        m = 10 * m + r;
    }
    return m;
}
