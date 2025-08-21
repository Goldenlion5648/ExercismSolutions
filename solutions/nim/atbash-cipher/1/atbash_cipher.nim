import algorithm
import strutils
import sequtils
import std/re

proc encode*(s: string): string =
    var letters = ('a'..'z').toSeq
    var flipped = letters.reversed
    var output: seq[string] = @[]
    for letter in s:
        if not letter.isAlphaNumeric:
            continue
        if letter.isDigit:
            output.add($letter)
            continue
        output.add($flipped[int(letter.toLowerAscii) - int('a')])
    return output.join("").findAll(re".{1,5}").join(" ")
        
    

proc decode*(s: string): string =
    var letters = ('a'..'z').toSeq
    var output: seq[string] = @[]
    for letter in s:
        if not letter.isAlphaNumeric:
            continue
        if letter.isDigit:
            output.add($letter)
            continue
        output.add($letters[^(int(letter.toLowerAscii) - int('a') + 1)])
    return output.join("")
