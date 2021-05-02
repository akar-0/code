def is_triangular(n):
    if n < 0:return False
    c= -2*n
    a=b=1
    d=b*b-4*a*c
    if (d < 0): return False
    e=d**.5
    return any(x>0 and x==int(x) for x in ((-b+e)/(2*a),(-b-e)/(2*a)))




sum: n * (n + 1) * (n + 2) / 6
