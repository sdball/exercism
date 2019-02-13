defmodule Bob do
  def hey(input) do
    cond do
      shouting?(input) && asking_a_question?(input) ->
        "Calm down, I know what I'm doing!"
      shouting?(input) ->
        "Whoa, chill out!"
      asking_a_question?(input) ->
        "Sure."
      silence?(input) ->
        "Fine. Be that way!"
      true ->
        "Whatever."
    end
  end

  defp shouting?(input) do
    input == String.upcase(input) && input != String.downcase(input)
  end

  defp asking_a_question?(input) do
    input
    |> String.ends_with?("?")
  end

  defp silence?(input) do
    input
    |> String.trim
    |> String.length == 0
  end
end
