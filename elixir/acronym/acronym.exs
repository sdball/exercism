defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> find_words
    |> take_first_letters
  end

  defp find_words(string) do
    Regex.scan(~r/[A-Z]?[a-z]+/, string)
    |> List.flatten
  end

  defp take_first_letters(words) do
    words
    |> Enum.map(&String.first/1)
    |> Enum.map(&String.upcase/1)
    |> Enum.join
  end
end
