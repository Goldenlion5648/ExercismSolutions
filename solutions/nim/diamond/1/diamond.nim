import strutils
import sequtils

proc diamond*(c: char): string =
    var dotsPerSide = int(c) - int('A')
    let totalLineLength = dotsPerSide * 2 + 1
    var shown: seq[string] = @[]
    
    for (letter, y) in zip(('A'..'Z').toSeq, countdown(dotsPerSide, 0).toSeq):
        var edgeSpace = " ".repeat(y)
        if letter == 'A':
            shown.add(edgeSpace & letter & edgeSpace)
        else:
            shown.add(edgeSpace & letter & " ".repeat(totalLineLength - y * 2 - 2) & letter & edgeSpace)
    
    for i in countdown(shown.high-1, 0):
        shown.add(shown[i])
    return shown.join("\n") & "\n"

