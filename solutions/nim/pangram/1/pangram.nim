import strutils
import std/algorithm
import sequtils

proc isPangram*(s: string): bool =
    let lowerVersion = s.toLower
    LowercaseLetters.allIt(it in lowerVersion)
