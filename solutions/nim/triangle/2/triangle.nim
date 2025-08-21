import sequtils

proc isValid(sides: array[3, int]): bool = 
    let 
        a = sides[0]
        b = sides[1]
        c = sides[2]
    a + b >= c and b + c >= a and a + c >= b and sides.foldl(a + b) > 0

proc isEquilateral*(sides: array[3, int]): bool =
    sides.allIt(it == sides[0]) and isValid(sides)
proc isIsosceles*(sides: array[3, int]): bool =
    len(sides.deduplicate) <= 2 and isValid(sides)

proc isScalene*(sides: array[3, int]): bool =
    len(sides.deduplicate) == 3 and isValid(sides)
