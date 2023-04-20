import random
import numpy as np

N = 1000000

xlst = [ random.uniform(-10.,10.) for _ in range(N) ]

xarr = np.array(xlst, dtype='float64')

def ranged_forloop(xs):
    total = 0
    for i in xs:
        total += abs(i)
    return total

def indexed_forloop(xs):
    total = 0
    for i in range(N):
        total += abs(xs[i])
    return total

def functional_plain(xs):
    return sum(map(abs,xs))

def functional_numpy(xs):
    return np.sum(np.abs(xs))
