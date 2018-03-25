defmodule NearBy do
  def is_nearby(word) do
    word
    |> tokenize
    |> check(0)
  end

  defp tokenize(word) do
    for <<x::binary-1 <- word>>, do: x
  end

  defp check([], _counter), do: false

  defp check(letters, counter) do
    [letter | new_letters] = letters

    case {letter, counter} do
      {l, c} when l == "z" and c <= 3 -> true
      {l, c} when l != "a" -> check(new_letters, c + 1) # add to counter
      {l, c} when l == "a" -> check(new_letters, 1) # start new count
    end
  end
end
