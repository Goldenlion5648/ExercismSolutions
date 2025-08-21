import strutils
import sequtils

proc row*(s: string, n: int): seq[int] =
    var rows = s.splitLines
    return rows[n-1].splitWhitespace.map(parseInt)


proc column*(s: string, n: int): seq[int] =
    var rows = s.splitLines.mapIt(it.splitWhitespace)
    for y in 0..rows.high:
        result.add(parseInt(rows[y][n-1]))
    
