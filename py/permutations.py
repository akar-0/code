from math import factorial

def nth_perm(n,d):
    n=n%factorial(d) or d
    digits=list(map(str,range(d)))
    for i in range(n-1):
        try: i=next(i for i in range(d-2,-1,-1) if digits[i]<digits[i+1])
        except StopIteration: return ''.join(digits)
        else:
            j=next(j for j in range(d-1,-1,-1) if digits[j]>digits[i])
            digits[i], digits[j]=digits[j], digits[i]
            digits=digits[:i+1]+digits[i+1:][::-1]
    else: return ''.join(digits)
