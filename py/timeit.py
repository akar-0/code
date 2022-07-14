import timeit

timeit.repeat("for n in range(200): f(n)", "from __main__ import f", number=50_000)
