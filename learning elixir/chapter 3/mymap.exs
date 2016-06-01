defmodule MyMap do
    def map([], _) do
        []
    end

    def map([h|t], f) do
        [f.(h) | map(t, f)]
    end
end

square = &(&1 * &1)

double = &(&1 * 2)

# MyMap.map([1, 2, 3, 4, 5], square)

# MyMap.map([1, 2, 3, 4, 5], double)