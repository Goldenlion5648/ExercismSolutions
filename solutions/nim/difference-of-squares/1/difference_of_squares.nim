import math

proc sumOfOneToN(n: int): int =
    return n * (n + 1) div 2

proc squareOfSum*(n: int): int =
    sumOfOneToN(n) ^ 2

proc sumOfSquares*(n: int): int =
    n * (n + 1) * (2 * n + 1) div 6

proc difference*(n: int): int =
  squareOfSum(n) - sumOfSquares(n)
