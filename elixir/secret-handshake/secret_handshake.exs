defmodule SecretHandshake do
  use Bitwise

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    commands(code, [])
  end

  defp commands(code, actions) do
    { code, actions }
    |> maybe_wink
    |> maybe_double_blink
    |> maybe_close_your_eyes
    |> maybe_jump
    |> maybe_reverse
    |> elem(1)
  end

  defp maybe_wink({code, actions}) when (code &&& 0b00001) == 0b00001 do
    {code, ["wink" | actions]}
  end
  defp maybe_wink({code, actions}) do
    {code, actions}
  end

  defp maybe_double_blink({code, actions}) when (code &&& 0b00010) == 0b00010 do
    {code, ["double blink" | actions]}
  end
  defp maybe_double_blink({code, actions}) do
    {code, actions}
  end

  defp maybe_close_your_eyes({code, actions}) when (code &&& 0b00100) == 0b00100 do
    {code, ["close your eyes" | actions]}
  end
  defp maybe_close_your_eyes({code, actions}) do
    {code, actions}
  end

  defp maybe_jump({code, actions}) when (code &&& 0b01000) == 0b01000 do
    {code, ["jump" | actions]}
  end
  defp maybe_jump({code, actions}) do
    {code, actions}
  end

  defp maybe_reverse({code, actions}) when (code &&& 0b10000) == 0b10000 do
    {code, actions}
  end
  defp maybe_reverse({code, actions}) do
    {code, Enum.reverse(actions)}
  end
end
