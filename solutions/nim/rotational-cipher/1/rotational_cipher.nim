import strutils
import sequtils
import sugar

proc getShiftedLetter(letterList: string, toFind: char, n: int): char =
    letterList[(letterList.find(toFind) + n) mod letterList.len]

proc rotate*(s: string, n: int): string =
    var lettersLower = ""
    var lettersUpper = ""
    for letter in 'a'..'z':
        lettersLower &= letter
        lettersUpper &= letter.toUpperAscii
    let shifted = collect:
        for letter in s:
            if letter.isLowerAscii:
                getShiftedLetter(lettersLower, letter, n)
            elif letter.isUpperAscii:
                getShiftedLetter(lettersUpper, letter, n)
            else:
                letter
    result = shifted.join
