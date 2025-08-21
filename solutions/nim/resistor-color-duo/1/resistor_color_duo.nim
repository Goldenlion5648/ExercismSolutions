import algorithm
type
  ResistorColor* = enum
    Black, Brown, Red, Orange, Yellow, Green, Blue, Violet, Grey, White

proc value*(colors: openArray[ResistorColor]): int =
    var mult = 1
    for color in colors[0..1].reversed:
        result += int(color) * mult
        mult *= 10
