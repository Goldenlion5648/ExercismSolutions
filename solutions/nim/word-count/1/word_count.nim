import std/tables
import strutils
import sugar
import sequtils
import re

proc createCountTable(strings: seq[string]): Table[string, int] =
  var countTable = initTable[string, int]()
  for str in strings:
    countTable[str] = countTable.getOrDefault(str, 0) + 1
  return countTable


proc countWords*(s: string): Table[string, int] =
    let filtered = collect:
        for i in 0..<s.len:
            if s[i] == '\'':
                if i in [0, s.len - 1]:
                    ""
                elif (
                    s[i-1].isAlphaAscii xor 
                    s[i+1].isAlphaAscii
                    ):
                    ""
                else:
                    "'"
            else:
                $s[i].toLowerAscii
    let filteredAsString = filtered.join

            
    let afterSplit = filteredAsString.split(Whitespace + PunctuationChars - {'\''}).filterIt(not it.isEmptyOrWhitespace)
    let counts = afterSplit.toCountTable()
    result = collect:
        for k, v in counts: {k : v}

