defmodule LongestWord do
  def longest(sentence, longest \\ "")

  def longest("", longest), do: longest

  def longest(sentence, longest) do
    words = String.split(sentence, " ")
    new_sentence = replace_sentence(words)
    [word | _] = words

    cond do
      String.length(word) > String.length(longest) -> longest(new_sentence, word)
      String.length(word) <= String.length(longest) -> longest(new_sentence, longest)
    end
  end

  # PRIVATE FUNCTIONS
  defp replace_sentence(words) do
    [_ | tail] = words

    tail
    |> Enum.reduce("", fn(word, acc) -> acc <> " " <> word end)
    |> String.trim()
  end
end
