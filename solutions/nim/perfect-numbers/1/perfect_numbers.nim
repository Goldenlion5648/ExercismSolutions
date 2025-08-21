import sets
import sequtils
import sugar

type
  Classification* = enum
    Perfect, Deficient, Abundant

proc classify*(n: int): Classification =
    if n <= 0:
        raise newException(ValueError, "must be positive")
    var factors = initHashSet[int]()
    var cur = 1
    while cur * cur <= n:
        if n mod cur == 0 and n != cur:
            factors.incl(cur)
            if n div cur != n:
                factors.incl(n div cur)
        cur += 1
    var total = 0
    for x in factors:
        total += x
    if total == n:
        return Perfect
    if total < n:
        return Deficient
    return Abundant
