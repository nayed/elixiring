defmodule ProcessEnum do
  def map1(range) do
    range |> Enum.to_list |> Enum.map(fn(x) -> x * x end)
  end

  def map2(range) do
    range |> Enum.map(fn(x) -> x * x end)
  end

  def tenFirstOdd1 do
    1..100
    |> Enum.filter(fn(x) -> rem(x, 2) != 0 end)
    |> Enum.take(10)
  end

  def tenFirstOdd2 do
    1..100
    |> Enum.take_every(2)
    |> Enum.take(10)
  end

  def sumTenFirstSquare do
    1..10
    |> Enum.map(&(&1 * &1))
    |> Enum.sum
  end

  def sumTenFirstSquareReduce do
    1..10
    |> Enum.map(&(&1 * &1))
    |> Enum.reduce(fn(x, acc) -> x + acc end)
  end

  def productTenFirstSquare do
    1..10
    |> Enum.map(&(&1 * &1))
    |> Enum.reduce(1, &(&1 * &2))
  end
end


IO.inspect ProcessEnum.map1(1..5)
# => [1, 4, 9, 16, 25]


IO.inspect ProcessEnum.map2(1..5)
# => [1, 4, 9, 16, 25]


IO.inspect ProcessEnum.tenFirstOdd1
# => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]


IO.inspect ProcessEnum.tenFirstOdd2
# => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]


IO.inspect ProcessEnum.sumTenFirstSquare
# => 385


IO.inspect ProcessEnum.sumTenFirstSquareReduce
# => 385


IO.inspect ProcessEnum.productTenFirstSquare
# => 13168189440000
