defmodule Reverse do
  @doc """
  Reverse a list

  ## Example
      iex> Reverse.reverse [1, 2, 3]
      [3, 2, 1]
  """
  def reverse([]), do: []

  def reverse([h|t]), do: reverse(t) ++ [h]
end
