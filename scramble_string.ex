# Write a method that takes in a string and an array of indices in the
# string. Produce a new string, which contains letters from the input
# string in the order specified by the indices of the array of indices.

defmodule Scramble do
  def string(string, index_list) do
    indexes = adjust_by_one(index_list) # because no one would refer to the position of a letter at zero...
    string
    |> tokenize
    |> index(indexes)
  end

  defp adjust_by_one(index_list) do
    Enum.map(index_list, fn(number) -> number - 1 end)
  end

  defp tokenize(string) do
    for<<letter::binary-1 <- string>>, do: letter
  end

  defp index(string_list, index, new_string \\ "")

  defp index(_string_list, [], new_string), do: new_string

  defp index(string_list, index, new_string) do
    current_index = Enum.at(index, 0)
    new_index = index -- [current_index]

    letter = Enum.at(string_list, current_index)

    index(string_list, new_index, new_string <> letter)
  end
end
