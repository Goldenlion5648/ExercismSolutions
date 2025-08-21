import strutils
import sugar
import sequtils
proc hey*(s: string): string =
    let s = s.strip
    var has_upper = false
    for letter in s:
        if isUpperAscii(letter):
            has_upper = true
        
    let upper_condition_satisfied = s.toUpper == s and has_upper
    if s == "":
        return "Fine. Be that way!"
    if s[^1] == '?' and upper_condition_satisfied:
        return "Calm down, I know what I'm doing!"
    if s[^1] == '?':
        return "Sure."
    if upper_condition_satisfied:
        return "Whoa, chill out!"
    return "Whatever."

