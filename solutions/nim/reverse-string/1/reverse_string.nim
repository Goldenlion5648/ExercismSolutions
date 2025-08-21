import algorithm
import strutils

proc reverse*(s: string): string =
    s.reversed.join
