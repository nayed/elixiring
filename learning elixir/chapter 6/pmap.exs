defmodule MyMap do
  def pmap(collection, f) do
    collection
    |> Enum.map(&(Task.async(fn -> f.(&1) end)))
    |> Enum.map(&Task.await/1)
  end
end

#IO.inspect MyMap.pmap(1..10000, &(&1 * &1))
