from itertools import circle
from gmpy2 import is_prime
from collections import Counter

def factors(n):
    if is_prime(n):return {n:1}
    L=[]
    while not n%2:
        L.append(2)
        n = n>>1
    for p in (3,5):
        while not n%p:
            L.append(p)
            n //=p
    else: p += 2
    i=iter(cycle((4, 2, 4, 2, 4, 6, 2, 6)))
    while n != 1:
        while not n%p: L.append(p); n //=p
        else: p += next(i)
    else: return Counter(L)
