import sugar
import tables
import strutils

proc score*(word: string): int =
    let values = { "A, E, I, O, U, L, N, R, S, T" :       1,
    "D, G":                               2,
    "B, C, M, P":                         3,
    "F, H, V, W, Y":                      4,
    "K":                                  5,
    "J, X":                               8,
    "Q, Z":                               10,
    }.toTable
    var letterToScore = collect:
        for longString, score in values.pairs:
            for letter in longString.split(", "):
                {letter : score }

    for letter in word:
        result += letterToScore[$letter.toUpperAscii]
