defmodule KitchenCalculator do
  def get_volume({_, second}) do
    second
  end

  def to_milliliter({:milliliter, amount}) do
    {:milliliter, amount}
  end
  def to_milliliter({:cup, amount}) do
    {:milliliter, amount * 240}
  end
  def to_milliliter({:fluid_ounce, amount}) do
    {:milliliter, amount * 30}
  end
  def to_milliliter({:teaspoon, amount}) do
    {:milliliter, amount * 5}
  end
  def to_milliliter({:tablespoon, amount}) do
    {:milliliter, amount * 15}
  end

  def from_milliliter({:milliliter, amount}, :milliliter) do
    {:milliliter, amount}
  end
  def from_milliliter({:milliliter, amount}, :cup) do
    {:cup, amount / 240}
  end
  def from_milliliter({:milliliter, amount}, :fluid_ounce) do
    {:fluid_ounce, amount / 30}
  end
  def from_milliliter({:milliliter, amount}, :teaspoon) do
    {:teaspoon, amount / 5}
  end
  def from_milliliter({:milliliter, amount}, :tablespoon) do
    {:tablespoon, amount / 15}
  end

  def convert(volume_pair, unit) do
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
