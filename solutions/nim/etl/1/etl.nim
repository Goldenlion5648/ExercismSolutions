import std/tables
import strutils

proc transform*(t: Table[int, seq[char]]): Table[char, int] =
    for number in t.keys:
        for letter in t[number]:
            result[letter.toLowerAscii] = number
