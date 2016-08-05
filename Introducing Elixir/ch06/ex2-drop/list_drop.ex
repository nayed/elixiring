defmodule ListDrop do
  def falls(list) do
    falls(list, [])
  end

  defp falls([], results) do
    results
  end

  defp falls([head | tail], results) do
    falls(tail, [Drop.fall_velocity(head) | results])
  end
end
