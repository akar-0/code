getMatrixProduct=lambda a,b:(-1,[[sum(c*d for c,d in zip(e,f))for f in zip(*b)]for e in a])[len(b)==len(a[0])]

numpy.matmul(a,b)
