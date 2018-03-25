defmodule Palindrome do

  def is_palindrome(word) do
    mp = Integer.floor_div(String.length(word), 2)
    word
    |> tokenize
    |> check(mp, 0)
  end

  defp tokenize(word) do
    for <<l::binary-1 <- word>>, do: l
  end

  defp check(_letters, mp, mp_count) when mp == mp_count, do: true

  defp check(letters, mp, mp_count) do
    first_elem = List.first(letters)
    last_elem = List.last(letters)

    new_letters = Enum.slice(letters, 1..-2)

    case {first_elem, last_elem} do
      {x,y} when x == y -> check(new_letters, mp, mp_count + 1)
      _ -> false
    end
  end

end
