defmodule GreatestCommonFactor do
  def gcf(num_one, num_two) do
    x = factors(num_one)
    y = factors(num_two)

    common_factors(x,y) |> List.last
  end

  defp common_factors(x,y) do
    Enum.flat_map(x, fn(x_element) ->
      Enum.filter(y, fn(y_element) -> y_element == x_element end) end)
  end

  defp factors(number, dividor \\ 1, n_factors \\ [])

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
