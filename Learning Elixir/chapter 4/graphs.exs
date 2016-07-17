defmodule Graph do
  def ancestorDag(dag) do
    dag
    |> Enum.map(fn({node, neighbors}) ->
      neighbors
      |> Tuple.to_list
      |> Enum.map(fn(child) -> {child, node} end)
    end)                                          # => [[b: :a, c: :a], [c: :b, d: :b], [e: :c], [e: :d], []]
    |> List.flatten
    |> (fn(nodes) -> {nodes |> Keyword.keys |> Enum.uniq, nodes} end.())    # => {[:b, :c, :d, :e], [b: :a, c: :a, c: :b, d: :b, e: :c, e: :d]}
    |> (fn({keys, nodes}) -> keys
    |> Enum.map(fn(key) -> {key, nodes |> Keyword.get_values(key) |> List.to_tuple} end) end).()
  end
end

IO.puts '
    A   B   C
A   0   1   1
B   1   0   1
C   1   1   0'
k3 = [a: {:b, :c}, b: {:a, :c}, c: {:a, :b}]
IO.inspect k3


IO.puts '

A ---> B ---> D
\\      |      |
 \\---> C ---> E
'
dag = [a: {:b, :c}, b: {:c, :d}, c: {:e}, d: {:e}, e: {}]
IO.puts "dag -> "
IO.inspect dag


IO.puts "dag ancestors -> "
IO.inspect Graph.ancestorDag dag
# => [b: {:a}, c: {:a, :b}, d: {:b}, e: {:c, :d}]

#IO.inspect :timer.tc(Graph, :ancestorDag, [dag])
