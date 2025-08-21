import random
import math

type
  Name* = array[5, char]
  Robot* = object
    name*: Name

randomize()
proc getNumsPart(): string = 
    for i in 1..3:
        result.add($rand(0..9))

proc getLettersPart(): string = 
    for i in 1..2:
        result.add($rand('A'..'Z'))
        
proc setName(robot: var Robot) =
    robot.name[0..1] = getLettersPart()
    robot.name[2..4] = getNumsPart()


proc makeRobot*: Robot =
    setName(result)

proc reset*(r: var Robot) =
    setName(r)
