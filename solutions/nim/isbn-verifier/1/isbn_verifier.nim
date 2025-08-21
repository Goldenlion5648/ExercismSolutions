import strutils
import algorithm

proc isValid*(s: string): bool =
    var num = s.replace("-", "")
    if num.len != 10:
        return false
    var total = 0
    for i, digit in num.reversed:
        var value = 0
        if digit == 'X':
            if i != 0:
                return false
            value = 10
        else:
            if not digit.isDigit:
                return false
            value = ($digit).parseInt
        total += (i + 1) * value
    return total mod 11 == 0
