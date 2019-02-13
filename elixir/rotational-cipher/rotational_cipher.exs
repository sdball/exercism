defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.to_charlist
    |> do_rotate(shift)
    |> IO.chardata_to_string
  end

  defp do_rotate(chars, shift) when is_list(chars) do
    chars |> Enum.map(&(do_rotate(&1, shift)))
  end
  defp do_rotate(char, shift) when char in ?A..?Z do
    Integer.mod(char + shift - ?A, 26) + ?A
  end
  defp do_rotate(char, shift) when char in (?a..?z) do
    Integer.mod(char + shift - ?a, 26) + ?a
  end
  defp do_rotate(char, _), do: char
end

