import std/times

proc addGigasecond*(dt: DateTime): DateTime =
    result = dt + 1000000000.seconds
