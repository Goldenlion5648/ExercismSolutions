import sets
import sequtils

proc get_multiples_of_n_up_to(n, limit: int) : seq[int] =
    var current = n
    while current < limit:
        result.add(current)
        current += n

proc sum*(limit: int, factors: openArray[int]): int =
    var seen: HashSet[int] = initHashSet[int]()
    for num in factors:
        if num == 0:
            continue
        let values: seq[int] = get_multiples_of_n_up_to(num, limit)
        for value in values:
            seen.incl(value)
    if len(seen) == 0:
        return 0
    return toSeq(seen).foldl(a + b)

    

        
