def merge(*args):
    d = {}
    for arg in args:
        for key in arg:
            d[key] = d.get(key, 0) + arg[key]
    else: return d
