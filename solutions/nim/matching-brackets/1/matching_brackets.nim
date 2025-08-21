import tables
proc isPaired*(s: string): bool =
    var seen: seq[char] = @[]
    let matches = {
        '}' : '{',
        ')' : '(',
        ']' : '[',
    }.toTable
    for letter in s:
        if letter in "[{(":
            seen.add(letter)
        elif letter in "]})":
            if len(seen) > 0:
                if letter in matches and matches[letter] == seen[^1]:
                    discard seen.pop
                    continue
            return false
        
    return len(seen) == 0
