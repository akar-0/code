def find_divisors(n):
    return set(sum([[k, n//k] for k in filter(lambda x:not n%x,range(2,int(n**.5)+1))], [])).union({1})

def factors(n):
    arr = [1]
    m = n
    isq = isqrt(n)
    p = 2
    while m != 1 or p <= isq:
        q, r = divmod(m, p)
        if r == 0:
            arr.append(p)
            while r == 0:
                m = q
                q, r = divmod(m, p)
        p = next_prime(p)
    if m > 1: arr.append(n)
    return arr
