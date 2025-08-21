import sequtils
import strutils
import math
import re

proc splitIntoChunks(toSplit: string, chunkSize: int): seq[string] =
    toSplit.findAll(re(".{1," & ($chunkSize) & "}"))

proc encrypt*(s: string): string =
    let filteredInput = s.mapIt(it.toLowerAscii).filterIt(not it.isSpaceAscii and not (it in PunctuationChars)).join
    let filteredLen = filteredInput.len
    if filteredLen == 0:
        return
    let size = sqrt(float(filteredInput.len))
    var dimX, dimY: int
    let sizeSquared = int(size) ^ 2
    # we can make a square
    if float(filteredInput.len) == float(sizeSquared): 
        dimX = int(size)
        dimY = int(size)
    else:
        dimX = int(ceil(size))
        dimY = int(floor(size))
        if dimX * dimY < filteredInput.len:
            dimY += 1
    
    var groups = splitIntoChunks(filteredInput, dimX)
    groups[^1] = groups[^1].alignLeft(dimX)

    var joinedColumns: seq[char] = @[]
    for x in 0..<dimX:
        for y in 0..<dimY:
            joinedColumns.add(groups[y][x])
    return splitIntoChunks(joinedColumns.join, dimY).join(" ")
    
        
