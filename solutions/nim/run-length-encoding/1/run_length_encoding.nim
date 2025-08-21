import strutils

proc encode*(s: string): string =
    var pos = 0
    var streak = 0
    while pos < len(s):
        streak = 1
        while pos + 1 < len(s) and s[pos + 1] == s[pos]:
            streak += 1
            pos += 1
        if streak > 1:
            result.add($streak & s[pos])
        else:
            result.add(s[pos])
        pos += 1



proc decode*(s: string): string =
    var pos = 0
    while pos < len(s):
        var curNum: string = ""
        while s[pos].isDigit:
            curNum.add(s[pos])
            pos += 1
        if curNum.len == 0:
            curNum = "1"
        result.add(s[pos].repeat(curNum.parseInt))
        pos += 1
        
