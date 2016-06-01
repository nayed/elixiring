defmodule MyMap do
    def map([], _) do
        []
    end

    def map([h|t], f) do
        [f.(h) | map(t, f)]
    end
end

square = fn x -> x * x end

double = fn x -> x * 2 end

MyMap.map([1, 2, 3, 4, 5], square)