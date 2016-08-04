defmodule Drop do

  def fall_velocity({planemo, distance}) when distance >= 0 do
    fall_velocity(planemo, distance)
  end

  # OR with Tuple::elem function
  #def fall_velocity(where) do
  #  fall_velocity(elem(where, 0), elem(where, 1))
  #end

  # OR with pattern matching
  #def fall_velocity(where) do
  #  {planemo, distance} = where
  #  fall_velocity(planemo, distance)
  #end

  defp fall_velocity(:earth, distance) do
    :math.sqrt(2 * 9.8 * distance)
  end

  defp fall_velocity(:moon, distance) do
    :math.sqrt(2 * 1.6 * distance)
  end

  defp fall_velocity(:mars, distance) do
    :math.sqrt(2 * 3.71 * distance)
  end
end
