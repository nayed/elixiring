defmodule ProcessStream do
  def tenFirstOdd do
    1..100
    |> Stream.filter(&(rem(&1, 2) != 0))
    |> Enum.take(10)
  end
end


IO.inspect ProcessStream.tenFirstOdd
# => [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]


enum_f = fn() ->
  1..10000000
  |> Enum.filter(&(rem(&1, 2) != 0))
  |> Enum.take(10)
end
IO.inspect :timer.tc(enum_f)
# => SO LOW

stream_f = fn() ->
  1..10000000
  |> Stream.filter(&(rem(&1, 2) != 0))
  |> Enum.take(10)
end
IO.inspect :timer.tc(stream_f)
# => SO SO SO FAST OMG
