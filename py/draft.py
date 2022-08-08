L=[]
for a in count(2):
    a*=a
    for x in range(1,2*a+1):
        if b(a,x):
            e=sorted((a, x, isqrt(a * (a + x))))
            s=sum(e)
            L.append([tuple(e), sum(e)])
    if s>1_500_000:break
