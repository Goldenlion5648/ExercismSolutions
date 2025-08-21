import math
proc isArmstrongNumber*(n: int): bool =
    var remaining = n
    var total = 0
    let totalDigits = len($n)
    while remaining > 0:
        let currentDigit = remaining mod 10
        total += currentDigit ^ totalDigits
        remaining = remaining div 10
    return total == n

