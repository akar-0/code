from itertools import cycle
from gmpy2 import is_prime
from collections import Counter

def factors(n):
    if is_prime(n):return {n:1}
    L=[]
    for p in (2,3,5):
        while not n%p:
            L.append(p)
            n //=p
    else: p += 2
    i=iter(cycle((4, 2, 4, 2, 4, 6, 2, 6)))
    while n != 1:
        while not n%p: L.append(p); n //=p
        else: p += next(i)
    else: return Counter(L)
