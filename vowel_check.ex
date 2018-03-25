defmodule VowelCheck do
  def vowel_check(sentence) do
    sentence |> String.replace(" ", "") |> format |> count
  end

  defp count(letters) do
    vowels =["a", "e", "i", "o", "u"]
    Enum.count(letters, fn(letter) -> Enum.member?(vowels, letter) end)
  end

  defp format(str) do
    for<<x::binary-1 <- str>>, do: String.downcase(x)
  end
end
