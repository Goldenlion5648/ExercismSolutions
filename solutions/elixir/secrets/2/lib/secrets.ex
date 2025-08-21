defmodule Secrets do
  def secret_add(secret) do
    fn other_arg ->
      other_arg + secret
    end
  end

  def secret_subtract(secret) do
    fn other_arg ->
      other_arg - secret
    end
  end

  def secret_multiply(secret) do
    fn other_arg ->
      other_arg * secret
    end
  end

  def secret_divide(secret) do
    fn other_arg ->
      div(other_arg, secret)
    end
  end

  def secret_and(secret) do
    fn second ->
      Bitwise.band(second, secret)
    end
  end

  def secret_xor(secret) do
    fn second ->
      Bitwise.bxor(second, secret)
    end
  end

  def secret_combine(secret_function1, secret_function2) do
    fn main_arg ->
      secret_function1.(main_arg) |> secret_function2.()
    end
  end
end
