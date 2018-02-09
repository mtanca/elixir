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
    |> separate_digits
    |> convert_digits_to_letters
    |> separate_letters
    |> letter_combinations
  end

  # PRIVATE FUNCTIONS
  defp convert_digits_to_letters(digits) do
    letters = find_letters(digits)

    letters
    |> Enum.map(fn {key, _value} -> Atom.to_string(key) end)
  end

  defp find_letters(digits) do
    letters = %{
      "abc": "2", "def": "3", "ghi": "4", "jkl": "5",
      "mno": "6", "pqrs": "7", "tuv": "8", "wxyz": "9"
    }

    Enum.map(digits, fn number ->
      Enum.find(letters, fn {_key, val} -> val == number end) end)
  end

  defp letter_combinations(list) do
    first_list = Enum.at(list,0)
    second_list = Enum.at(list,1)
    # Enum.flat_map(first_list, fn f_letter -> Enum.map(second_list, fn s_letter -> f_letter <> s_letter end) end)
    for x <- first_list, y <- second_list, do: x <> y
  end

  defp separate_digits(number_string) do
    for <<x::binary-1 <- number_string>>, do: x
  end

  defp separate_letters(letters) do
    Enum.map(letters, fn letter_list ->
      for <<x::binary-1 <- letter_list>>, do: x end)
  end
end
