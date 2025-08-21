import bitops
import tables
import sequtils
type
    Allergen* = enum
        Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

    

let mapping = { 
    Eggs: 1,
    Peanuts: 2,
    Shellfish: 4,
    Strawberries: 8,
    Tomatoes: 16,
    Chocolate: 32,
    Pollen: 64,
    Cats: 128,
}.toTable
    

proc allergies*(score: int): set[Allergen] =
    cast[set[Allergen]](score)
    # var allergies_list: seq[Allergen] = @[]
    # for i in 0..8:
    #     let shifted_value = 1 shl i
    #     if bitand(shifted_value, score) > 0:
    #         allergies_list.add(mapping[shifted_value])
    # return allergies_list.to

proc isAllergicTo*(score: int, allergen: Allergen): bool =
    return allergen in allergies(score)
            
