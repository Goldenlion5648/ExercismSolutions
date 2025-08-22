defmodule GuessingGame do
  def compare(secret_number, guess) when abs(secret_number - guess) == 1, do: "So close"
  def compare(secret_number, guess \\ :no_guess)
  def compare(secret_number, guess) when guess == :no_guess, do: "Make a guess"
  def compare(secret_number, guess) do
    cond do
      guess >  secret_number -> "Too high"
      guess <  secret_number -> "Too low"
      guess == secret_number -> "Correct"
    end
  end
end
