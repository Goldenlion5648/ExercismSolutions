import std/algorithm
import sugar

type
  Student* = object
    name*: string
    grade*: int

  School* = object
    students*: seq[Student]

proc get_names(school: School): seq[string]=
    result = collect:
        for student in school.students:
            student.name

proc roster*(school: School): seq[string] =
    ## Returns the names of every student in the `school`, sorted by grade then name.
    
    let sorted_students = (school.students).sorted do (x, y: Student) -> int:
        result = cmp(x.grade, y.grade)
        if result == 0:
            result = cmp(x.name, y.name)

    collect:
        for student in sorted_students:
            student.name


proc name_exists(name: string, school: School): bool =
    let existing_names = get_names(school)
    return existing_names.contains(name)

proc addStudent*(school: var School, name: string, grade: int) =
  ## Adds a student with `name` and `grade` to the `school`.
  ##
  ## Raises a `ValueError` if `school` already contains a student named `name`.
  let new_student = Student(name: name, grade: grade)
  if name_exists(name, school):
    raise newException(ValueError, "student already exists")
  school.students.add(new_student)

proc grade*(school: School, grade: int): seq[string] =
    ## Returns the names of the students in the given `school` and `grade`, in
    ## alphabetical order.
    result = collect:
        for student in school.students:
            if student.grade == grade:
                student.name
    result.sort

