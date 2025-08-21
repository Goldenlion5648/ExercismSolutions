import sequtils

proc distance*(a, b: string): int =
    if len(a) != len(b):
        raise newException(ValueError, "Must be equal length")
    for (x, y) in zip(a, b):
        if x != y:
            result += 1
