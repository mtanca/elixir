defmodule ZeroSum do
  def two_sums(numbers) do
    case sums_to_zero(numbers) do
      coordinates when coordinates != nil ->
        Enum.map(coordinates, &(index(&1, numbers)))
      _ -> nil
    end
  end

  defp sums_to_zero([]), do: nil

  defp sums_to_zero(numbers) do
    [number | numbers_to_check_against]  = numbers

    result = find(numbers_to_check_against, number)

    case result do
      x when x != nil -> [number, result]
      _ -> sums_to_zero(numbers_to_check_against)
    end
  end

  defp find(numbers, number) do
    Enum.find(numbers, fn(num) -> (num + number) == 0 end)
  end

  defp index(element, list) do
    Enum.find_index(list, fn(n) -> n == element end)
  end
end
