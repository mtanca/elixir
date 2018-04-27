
defmodule Hamming do
  def compute(s_one, s_two) do
    [strand_one, strand_two] =
      Enum.map([s_one, s_two], fn(strand) -> tokenize_strand(strand) end)

    distance(strand_one, strand_two)
  end

  def tokenize_strand(strand) do
    for<<letter::binary-1 <- strand>>, do: letter
  end

  defp distance(strand_one, strand_two, count \\ 0)

  defp distance([], _list, count), do: count

  defp distance(_list, [], count), do: count

  defp distance(strand_one, strand_two, count) do
    [head_one | tail_one] = strand_one
    [head_two | tail_two] = strand_two

    case {head_one, head_two} do
      {x, y} when x != y -> distance(tail_one, tail_two, count + 1)
      _ -> distance(tail_one, tail_two, count)
    end
  end
end
