import strutils
import std/algorithm
import sequtils

proc abbreviate*(s: string): string =
    result = s.replace('-', ' ').filterIt(it.isAlphaAscii or ($it).isEmptyOrWhitespace).join.splitWhitespace.mapIt(it[0].toUpperAscii).join
    
