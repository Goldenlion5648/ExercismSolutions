defmodule LanguageList do
  def new() do
    # Please implement the new/0 function
    []
  end

  def add(list, language) do
    # Please implement the add/2 function
    [language] ++ list
  end

  def remove(list) do
    [_ | tail] = list
    tail
  end

  def first(list) do
    [head | _] = list
    head
  end

  def count(list) do
    # Please implement the count/1 function
    length(list)
  end

  def functional_list?(list) do
    # Please implement the functional_list?/1 function
    "Elixir" in list
  end
end
