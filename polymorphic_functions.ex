defmodule Count do
  def element_count(number, digits) when is_integer(number) do
    digits
    |> separate_digits
    |> count_frequency(number)
  end

  def element_count(letter, sentence) when is_binary(letter) do
    sentence
    |> tokenize_sentence
    |> count_frequency(letter)
  end


  # PRIVATE FUNCTIONS
  defp count_frequency(list, element, count \\ 0)

  defp count_frequency([], _, count), do: count

  defp count_frequency(list, element, count) do
    [head | tail] = list
    case { head, element } do
      { x, x } -> count_frequency(tail, element, count + 1)
      { x, y } -> count_frequency(tail, element, count)
    end
  end

  defp separate_digits(number) do
    Integer.digits(number)
  end

  defp tokenize_sentence(sentence) do
    for <<letter::binary-1 <- sentence>>, do: letter
  end
end
