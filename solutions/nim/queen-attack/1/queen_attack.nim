import strutils

type
  Queen* = object
    row*: int
    col*: int

proc initQueen*(row, col: int): Queen =
    if row notin 0..7 or col notin 0..7:
        raise newException(ValueError, "invalid position")
    result.row = row
    result.col = col

proc canAttack*(white, black: Queen): bool =
    if white == black:
        raise newException(ValueError, "can not be on same spot")
    result = white.row == black.row or white.col == black.col
    # top left to bottom right
    for offset in -7..7:
        var 
            curRow = white.row + offset
            curCol = white.col + offset
        if curCol notin 0..7 or curRow notin 0..7:
            continue
        if curRow == black.row and curCol == black.col:
            result = true
            return
    # bottom left to upper right
    for offset in -7..7:
        var 
            curRow = white.row - offset
            curCol = white.col + offset
        if curCol notin 0..7 or curRow notin 0..7:
            continue
        if curRow == black.row and curCol == black.col:
            result = true
            return
        

proc board*(white, black: Queen): string =
    if white == black:
        raise newException(ValueError, "can not be on same spot")
    for y in 0..7:
        for x in 0..7:
            var occupied = false
            for piece in [white, black]:
                if piece.row == y and piece.col == x:
                    result.add(if piece == white: "W" else: "B")
                    occupied = true
                    break
            if occupied:
                continue
            result.add("_")
        result.add("\n")

            
