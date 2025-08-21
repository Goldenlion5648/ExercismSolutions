import strutils
import tables

proc isIsogram*(s: string): bool =
    var seen = initCountTable[char]()
    for letter in s.toLower:
        if letter in LowercaseLetters:
            seen[letter] = seen[letter] + 1
            if seen[letter] > 1:
                return false
    return true
