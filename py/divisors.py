def find_divisors(n):
    return set(sum([[k, n//k] for k in filter(lambda x:not n%x,range(2,int(n**.5)+1))], [])).union({1})
