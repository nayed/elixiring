defmodule Palindrome do
  @moduledoc """
  Check palindrome
  """

  @doc """
  Is it a palindrome?

  ## Example:
      iex> Palindrome.is_palindrome? "kayak"
      true
      iex> Palindrome.is_palindrome? "blue"
      false
  """
  def is_palindrome?(word) do
    String.reverse(word) == word
  end
end
