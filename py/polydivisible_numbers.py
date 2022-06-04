# from https://oeis.org/search?q=id:A144688&fmt=text

def agen():
    yield 0
    magic, biggermagic, digits = list(range(1, 10)), [], 2
    while len(magic) > 0:
        yield from magic
        for i in magic:
            for d in range(10):
                t = 10*i + d
                if t%digits == 0: biggermagic.append(t)
        magic, biggermagic, digits = biggermagic, [], digits+1
        
from itertools import islice
list(islice(agen(), 5))
