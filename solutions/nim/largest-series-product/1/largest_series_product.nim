import math
import sequtils
import strutils

proc largestProduct*(s: string, span: int): int =
    if span < 0 or span > s.len or not s.allIt(it.isDigit):
        raise newException(ValueError, "span must be positive")
    for i in 0..(s.len-span):
        result = max(result, s[i..<(i+span)].mapIt(parseInt($it)).prod)
        
