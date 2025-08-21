proc primeFactors*(n: int64): seq[int] =
    var divisor = 2
    var cur = n
    while divisor <= cur:
        if cur mod divisor == 0:
            result.add(divisor)
            cur = cur div divisor
            continue
        divisor += 1
        
