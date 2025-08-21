import strformat
proc twoFer*(name = ""): string =
    if name == "":
        result = "One for you, one for me."
    else:
        result = fmt"One for {$name}, one for me."
