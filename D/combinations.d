int[] comb(int[] arr, int n) {
    if (n==1) return arr;
    int[] o;
    for (int i = 0 ; i < cast(int)arr.length - n + 1 ; i++) {
        int h = arr[i];
        foreach(x;comb(arr[i+1..$], n - 1)) { o ~= x + h;}
    }
    return o;
}
