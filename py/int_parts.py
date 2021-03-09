#https://www.codewars.com/kata/5716a4c2794d305f4900156b/solutions/python
#https://www.codewars.com/kata/553291f451ab4fbcdc0001c6/solutions/python
def find_part_max_prod(n):
    a,b,c,s=[0]*(n+1),1,n-1,set()
    while b:
        h=a[b-1]+1
        b-=1
        while 2*h<=c: a[b]=h; c-=h; b+=1
        else: l=b+1
        while h<=c: a[b]=h; a[l]=c; e=tuple(a[:b+2][::-1]); s.add(e); h+=1; c-=1
        else: a[b]=h+c; e=tuple(a[:b+1][::-1]); s.add(e); c+=h-1
    else: return s
