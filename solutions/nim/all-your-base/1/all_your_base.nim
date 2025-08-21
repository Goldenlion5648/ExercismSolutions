import algorithm
import math

proc convert*(digits: openArray[int], fromBase: int, toBase: int): seq[int] =
    if fromBase <= 1 or toBase <= 1:
        raise newException(ValueError, "bases must be greater than 1")
    
    var total = 0
    for i, digit in digits.reversed:
        if digit >= fromBase or digit < 0:
            raise newException(ValueError, "digit was greater than base or less than 0")
        total += digit * (fromBase ^ i)

    var highestDigitNeeded = 1
    var digitPosition = 0
    if highestDigitNeeded < total:
        for i in 1..1000:
            if highestDigitNeeded * toBase <= total:
                highestDigitNeeded *= toBase
            else:
                break
            digitPosition += 1

    while digitPosition >= 0:
        if highestDigitNeeded <= total:
            let currentDigit = total div highestDigitNeeded
            total -= currentDigit * (toBase ^ digitPosition)
            result.add(currentDigit)
        else:
            result.add(0)
        digitPosition -= 1
        highestDigitNeeded = highestDigitNeeded div toBase
        
        
