defmodule GreatestCommonFactor do
  def gcf(num_one, num_two) do
    x = factors(num_one)
    y = factors(num_two)

    common_factors(x,y) |> List.last
  end

  # PRIVATE FUNCTIONS
  defp common_factors(x,y) do
    Enum.flat_map(x, fn(x_element) ->
      Enum.filter(y, fn(y_element) -> y_element == x_element end) end)
  end

  defp factors(number, divisor \\ 1, factors \\ [])

  defp factors(number, divisor, factors) when number < divisor, do: factors

  defp factors(number, divisor, factors) do
    remainder = mod(number, divisor)

    cond do
      remainder == 0 -> factors(number, divisor + 1, factors ++ [divisor])
      remainder != 0 -> factors(number, divisor + 1, factors)
    end
  end

  defp mod(0,_y), do: 0

  defp mod(x,y) when x > 0, do: rem(x, y)

  defp mod(x,y) when x < 0, do: rem(x, y) + y
end
