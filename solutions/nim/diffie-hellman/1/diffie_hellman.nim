import random
import math

proc privateKey*(p: int): int =
    randomize()
    return rand(2..(p-1))

proc publicKey*(p, g, a: int): int =
    (g ^ a) mod p

proc secret*(p, bPub, a: int): int =
    (bPub ^ a) mod p
