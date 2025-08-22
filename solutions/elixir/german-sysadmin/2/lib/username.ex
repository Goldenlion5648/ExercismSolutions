defmodule Username do
  def sanitize([]), do: []
  def sanitize([head | tail]) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    current =
      case head do
        ?ä -> ~c"ae"
        ?ö -> ~c"oe"
        ?ü -> ~c"ue"
        ?ß -> ~c"ss"
        ?_ -> ~c"_"
        x when (x >= ?a and x <= ?z) -> [x]
        _ -> ~c""
      end
    current ++ sanitize(tail)
  end
end
