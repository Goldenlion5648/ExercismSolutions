proc binarySearch*(a: openArray[int], val: int): int =
    if len(a) == 0:
        return -1
    var left = 0
    var right = len(a) - 1
    while true:
        var diff = right - left
        var midPos = right - (diff div 2)
        if a[midPos] == val:
            return midPos
        if left == right:
            return -1
        if a[midPos] > val:
            right = midPos - 1
        else:
            left = midPos + 1
