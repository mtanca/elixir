# Given a digit string, return all possible letter combinations that the number could represent.
# A mapping of digit to letters (just like on the telephone buttons) is given below.
# 2 - abc
# 3 - def
# 4 - ghi
# 5 - jkl
# 6 - mno
# 7 - pqrs
# 8 - tuv
# 9 - wxyz
# Input: "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].

defmodule PhoneNumber do
  def phone_letters(digits) when byte_size(digits) != 2, do: "Please enter two numbers"

  def phone_letters(digits) do

    digits
    |> separate
    |> convert_digits_to_letters
    |> combinations
  end

  # PRIVATE FUNCTIONS
  defp convert_digits_to_letters(digits) do
    letters = %{
      "2" => "abc", "3" => "def", "4" => "ghi", "5" =>"jkl",
      "6" => "mno", "7" => "pqrs", "8" => "tuv", "9" =>"wxyz"
    }

    digits
    |> Enum.map(fn(digit)-> letters[digit] end)
    |> Enum.map(fn(letters) -> separate(letters)end)
  end

  defp combinations(list) do
    [first_list, second_list] = list
    for x <- first_list, y <- second_list, do: x <> y
  end

  defp separate(list), do: for<<x::binary-1 <- list>>, do: x
end
