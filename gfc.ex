defmodule GreatestCommonFactor do

  def gfc(num_one, num_two) do
    x = factors(num_one, 1, [])
    y = factors(num_two, 1, [])

    common_factors(x,y) |> Enum.max
  end

  defp common_factors(x,y) do
    Enum.map(x, fn(x_f) ->
      Enum.filter(y, fn(y_f) -> y_f == x_f end) end) |> List.flatten
  end

  defp factors(number, dividor, n_factors) when number < dividor, do: n_factors

  defp factors(number, dividor, n_factors) do
    x = mod(number, dividor)

    cond do
      x == 0 -> factors(number, dividor + 1, n_factors ++ [dividor])
      x != 0 -> factors(number, dividor + 1, n_factors)
    end
  end

  defp mod(0,_y), do: 0

  defp mod(x,y) when x > 0, do: rem(x, y)

  defp mod(x,y) when x < 0, do: rem(x, y) + y

end
