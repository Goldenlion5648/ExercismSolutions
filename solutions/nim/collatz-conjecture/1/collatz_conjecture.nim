proc steps*(n: int): int =
    if n <= 0:
        raise newException(ValueError, "n must be positive")
    var cur = n
    while cur != 1:
        if cur mod 2 == 0:
            cur = cur div 2
        else:
            cur = (cur * 3) + 1
        result += 1
        
