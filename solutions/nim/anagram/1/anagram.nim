import tables
import strutils

proc detectAnagrams*(word: string, candidates: openArray[string]): seq[string] =
    let word2 = word.toLower
    var ogCounts = toCountTable(word2)
    for candidate in candidates:
        let candidateLower = candidate.toLower
        if word2 == candidateLower:
            continue
        var current = toCountTable(candidateLower)
        if ogCounts == current:
            result.add(candidate)
