proc slices*(s: string, n: int): seq[string] =
    if n notin 1..s.len:
        raise newException(ValueError, "n must satisfy 1 <= n <= s.len")
    for i in 0..s.len-n:
        result.add(s[i..<i+n])
