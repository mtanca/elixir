defmodule Count do
  def element_count(number, digits) when is_integer(number) do
    digits
    |> separate
    |> count_frequency(number)
  end

  def element_count(letter, sentence) when is_binary(letter) do
    sentence
    |> separate
    |> count_frequency(letter)
  end

  # PRIVATE FUNCTIONS
  defp count_frequency(list, element, count \\ 0)

  defp count_frequency([], _, count), do: count

  defp count_frequency(list, element, count) do
    [head | tail] = list
    case {head, element} do
      {x, x} -> count_frequency(tail, element, count + 1)
      {x, y} -> count_frequency(tail, element, count)
    end
  end

  defp separate(element) when is_integer(element) do
    Integer.digits(element)
  end

  defp separate(element) when is_binary(element) do
    for <<letter::binary-1 <- element>>, do: letter
  end
end
