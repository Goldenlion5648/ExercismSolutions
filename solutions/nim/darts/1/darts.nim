import math

proc score*(x, y: float): int =
    let dist = sqrt(x ^ 2 + y ^ 2)
    if dist > 10:
        result = 0
    elif dist > 5:
        result = 1
    elif dist > 1:
        result = 5
    else:
        result = 10

