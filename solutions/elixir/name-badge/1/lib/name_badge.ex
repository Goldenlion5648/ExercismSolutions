defmodule NameBadge do
  def print(id, name, department) do
    first_part = if id, do: "[#{id}] - ", else: ""

    last_part =
      if department do
        department |> String.upcase()
      else
        "OWNER"
      end

    "#{first_part}#{name} - #{last_part}"
  end
end
