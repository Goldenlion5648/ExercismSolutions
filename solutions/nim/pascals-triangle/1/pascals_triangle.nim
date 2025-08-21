import tables
import hashes
import math
import deques
import sequtils
import std/algorithm

type
  FloatCoordinate = tuple[y, x: float]


proc bfs(highestDepth: int, pascalTable: var Table[FloatCoordinate, int]) =
    let start : FloatCoordinate = (0.0, 0.0)
    pascalTable[start] = 1
    var fringe = [start].toDeque
    while fringe.len > 0:
        var currentPos = fringe.popFirst
        if currentPos.y > float(highestDepth) or (currentPos in pascalTable and currentPos != start):
            continue
        if currentPos != start:
            let upperLeftCoord: FloatCoordinate = (currentPos[0] - 1, currentPos[1] - 0.5)
            let upperRightCoord: FloatCoordinate = (currentPos[0] - 1, currentPos[1] + 0.5)
            let currentValue: system.int = pascalTable.getOrDefault(upperLeftCoord, 0) +
                                        pascalTable.getOrDefault(upperRightCoord, 0)
            pascalTable[currentPos] = currentValue
            
        for offset in [-0.5, 0.5]:
            fringe.addLast((currentPos[0] + 1, currentPos[1] + offset))
        

proc pascal*(n: int): seq[seq[int]] =
    var tableVersion = initTable[FloatCoordinate, int]()
    if n > 0:
        bfs(n-1, tableVersion)

    let sortedKeys = tableVersion.keys.toSeq.sorted
    for key in sortedKeys:
        var y = int(key.y)
        if len(result) < (y + 1):
            result.add(@[])
        result[^1].add(tableVersion[key])

