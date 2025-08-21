import strutils
import tables

type
    Plant* = enum
        Clover, Grass, Radishes, Violets

let mapping = {
    'C': Clover, 
    'G': Grass, 
    'R': Radishes, 
    'V': Violets
}.toTable

proc plants*(garden: string, student: string): seq[Plant] =
    let allStudents = @[
        "Alice", "Bob", "Charlie", "David", 
        "Eve", "Fred", "Ginny", "Harriet",
        "Ileana", "Joseph", "Kincaid", "Larry"
    ]
    let gardenRows = garden.splitLines
    for row in gardenRows:
        var studentPos = allStudents.find(student)
        for plant in row[studentPos*2 ..< (studentPos+1)*2]:
            result.add(mapping.getOrDefault(plant))
