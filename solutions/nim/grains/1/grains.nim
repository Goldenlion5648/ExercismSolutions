proc onSquare*(n: int): uint64 =
    if n in 1..64:
        return (1'u64) shl (n - 1)
    raise newException(ValueError, "invalid square")
    


proc total*: uint64 = uint64.high

