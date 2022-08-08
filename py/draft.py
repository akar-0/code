L=[]
for a in count(2):
    a*=a
    for x in range(1,2*a+1):
        if b(a,x):
            e=sorted((a, x, isqrt(a * (a + x))))
            s=sum(e)
            L.append([tuple(e), sum(e)])
    if s>1_500_000:break

        
        
        
from collections import defaultdict
d=defaultdict(list)
for n in count(2):
    for m in range(n+1,2*n):
        a=n*n
        b=m*n
        c=m**2-n**2
        p=a+b+c
        d[p].append((a,b,c))
        if p > 1500_000:break
    
