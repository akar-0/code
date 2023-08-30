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

from itertools import cycle
from gmpy2 import is_prime
from collections import Counter
from functools import lru_cache
from collections import defaultdict
    
@lru_cache(maxsize=None)
def factors(n):
    if is_prime(n):return {n:1}
    d=defaultdict(int)
    for p in (2,3,5):
        while not n%p:
            d[p]+=1
            n//=p
    else: p += 2
    i=iter(cycle((4, 2, 4, 2, 4, 6, 2, 6)))
    while n != 1:
        while not n%p: d[p]+=1; n //=p
        else: p += next(i)
    else: return d

# dfhwze

from gmpy2 import *
from functools import lru_cache
import random
import math
#  part of Prime factorization From Stackoverflow, (except pollard and brent)
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

@lru_cache(maxsize=None)
def brent(N):
    if N % 2 == 0:
        return 2
    y, c, m = random.randint(1, N - 1), random.randint(1, N - 1), random.randint(1, N - 1)
    g, r, q = 1, 1, 1
    while g == 1:
        x = y
        for i in range(r):
            y = ((y * y) % N + c) % N
        k = 0
        while k < r and g == 1:
            ys = y
            for i in range(min(m, r - k)):
                y = ((y * y) % N + c) % N
                q = q * (abs(x - y)) % N
            g = gcd(q, N)
            k = k + m
        r *= 2
    if g == N:
        while True:
            ys = ((ys * ys) % N + c) % N
            g = gcd(abs(x - ys), N)
            if g > 1:
                break

    return g
def pollard_rho_factor(n, x_start=2):
    def f(x):
        return (x ** 2 + 1) % n
    
    x = x_start
    y = x_start
    d = 1
    count = 10
    max_count = 15
    
    while d == 1 and count < max_count:
        ys = y
        for i in range(1, 2 ** count + 1):
            y = f(y)
            d = gcd(abs(x - y), n)
            if d != 1:
                break
        x = ys
        count += 1
    
    if d == n:
        return None
    else:
        return d
@lru_cache(maxsize=None)
def factorize(n):
    factors = []
    while n > 1:
        factor = pollard_rho_factor(n)
        
        if factor is None:
            factors.append(n)
            break
        else:
            factors.append(factor)
            n //= factor
    
    return factors
def primesbelow(N):
    correction = N % 6 > 1
    N = {0:N, 1:N-1, 2:N+4, 3:N+3, 4:N+2, 5:N+1}[N%6]
    sieve = [True] * (N // 3)
    sieve[0] = False
    for i in range(int(N ** .5) // 3 + 1):
        if sieve[i]:
            k = (3 * i + 1) | 1
            sieve[k*k // 3::2*k] = [False] * ((N//6 - (k*k)//6 - 1)//k + 1)
            sieve[(k*k + 4*k - 2*k*(i%2)) // 3::2*k] = [False] * ((N // 6 - (k*k + 4*k - 2*k*(i%2))//6 - 1) // k + 1)
    return [2, 3] + [(3 * i + 1) | 1 for i in range(1, N//3 - correction) if sieve[i]]

smallprimeset = set(primesbelow(100000))
_smallprimeset = 100000
def isprime(n, precision=7):
    if n < 1:
        raise ValueError("Out of bounds, first argument must be > 0")
    elif n <= 3:
        return n >= 2
    elif n % 2 == 0:
        return False
    elif n < _smallprimeset:
        return n in smallprimeset


    d = n - 1
    s = 0
    while d % 2 == 0:
        d //= 2
        s += 1

    for repeat in range(precision):
        a = random.randrange(2, n - 2)
        x = pow(a, d, n)
    
        if x == 1 or x == n - 1: continue
    
        for r in range(s - 1):
            x = pow(x, 2, n)
            if x == 1: return False
            if x == n - 1: break
        else: return False

    return True

def pollard_brent(n):
    if n % 2 == 0: return 2
    if n % 3 == 0: return 3

    y, c, m = random.randint(1, n-1), random.randint(1, n-1), random.randint(1, n-1)
    g, r, q = 1, 1, 1
    while g == 1:
        x = y
        for i in range(r):
            y = (pow(y, 2, n) + c) % n

        k = 0
        while k < r and g==1:
            ys = y
            for i in range(min(m, r-k)):
                y = (pow(y, 2, n) + c) % n
                q = q * abs(x-y) % n
            g = gcd(q, n)
            k += m
        r *= 2
    if g == n:
        while True:
            ys = (pow(ys, 2, n) + c) % n
            g = gcd(abs(x - ys), n)
            if g > 1:
                break

    return g
smallprimes = primesbelow(1000) 
def primefactors(n, sort=False):
    factors = []

    for checker in smallprimes:
        while n % checker == 0:
            factors.append(checker)
            n //= checker
        if checker > n: break

    if n < 2: return factors

    while n > 1:
        if isprime(n):
            factors.append(n)
            break
        factor = pollard_brent(n) # trial division did not fully factor, switch to pollard-brent
        factors.extend(primefactors(factor)) # recurse to factor the not necessarily prime factor returned by pollard-brent
        n //= factor

    if sort: factors.sort()

    return factors

def factorization(n):
    factors = {}
    for p1 in primefactors(n):
        try:
            factors[p1] += 1
        except KeyError:
            factors[p1] = 1
    return factors

totients = {}
def totient(n):
    if n == 0: return 1

    try: return totients[n]
    except KeyError: pass

    tot = 1
    for p, exp in factorization(n).items():
        tot *= (p - 1)  *  p ** (exp - 1)

    totients[n] = tot
    return tot

def gcd(a, b):
    if a == b: return a
    while b > 0: a, b = b, a % b
    return a

def lcm(a, b):
    return abs((a // gcd(a, b)) * b)
def fact(n):
    factors = []

    limit = int(n ** .5) + 1
    for checker in smallprimes:
        print(smallprimes[-1])
        if checker > limit: break
        while n % checker == 0:
            factors.append(checker)
            n //= checker


    if n < 2: return factors
    else : 
        factors.extend(bigfactors(n))
        return sorted(factors)

def bigfactors(n):
    factors = []
    while n > 1:
        if isprime(n):
            factors.append(n)
            break
        factor = pollard_brent(n) 
        factors.extend(bigfactors(factor))
        n //= factor
    return sorted(factors)

@lru_cache(maxsize=None)
def f(m:int) -> int:
    if is_prime(m):return m
    for i in range(1,150):
        if pow(i,i,m)==0:return i
    inf = []
    for i in range(450,1,-1):
        s = gmpy2.iroot(m, i)
        if s[1]:inf.append(s)
    for i in inf:
        if pow(i[0],i[0],m)==0:return i[0]
    for i in range(6500,0,-1):
        if m%i == 0 and m<pow(10,18):
                if pow(m//i,m//i,m)==0:return m//i
    if m > pow(10,22):
        br = brent(m)
        if pow(br,br,m)==0:
            return br
        plrList = list(set(bigfactors(m)))
        plr,v = [m//i for i in plrList],[]
        for i in plr:    
            if pow(i,i,m) == 0:
                v.append(i)
        if len(v) != 0: return min(v)
       # factors = set(factorize(m))
       # plr = m//max(factors)
       # if pow(plr,plr,m) == 0:
       #       return prl
    return m
