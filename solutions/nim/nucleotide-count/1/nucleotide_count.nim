import std/tables
import sequtils
import strutils

proc countDna*(s: string): CountTable[char] =
  result = s.toCountTable
  if not result.keys.toSeq.allIt($it in "ACGT"):
    raise newException(ValueError, "invalid DNA")
