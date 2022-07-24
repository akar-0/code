    // sieve of Eratosthenes
    bool[10000] p;
    p[] = true;
    p[0] = false;
    p[1] = false;
    for (int i = 2 ; i < 10000 ; i++) {
        if (p[i]) {
            for (int j = i + i ; j < 10000 ; j += i) {
                p[j] = false;
            }
        }
    }
