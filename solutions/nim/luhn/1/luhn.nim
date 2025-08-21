import sequtils
import strutils
import sugar
import algorithm

proc isValid*(s: string): bool =
    if s.strip.len == 1:
        return false
    var digits = collect:
        for i, digitChar in s.replace(" ", "").reversed.pairs:
            if digitChar notin ('0'..'9') and digitChar != ' ':
                return false
            let curInt = ($digitChar).parseInt
            if i mod 2 == 1:
                var temp = curInt * 2
                if temp > 9:
                    temp -= 9
                temp
            else:
                curInt
    let total = digits.foldl(a + b)
    return total mod 10 == 0


