defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> eliminate_punctuation
    |> normalize_case
    |> split_words
    |> count_words
  end

  defp eliminate_punctuation(sentence) do
    String.replace(sentence, ~r/[!@#$%^&*();:,.]/, "", global: true)
  end

  defp normalize_case(sentence) do
    String.downcase(sentence)
  end

  defp split_words(sentence) do
    String.split(sentence, ~r/[\s_]+/)
  end

  defp count_words(word_list) do
    Enum.reduce(word_list, %{}, fn(word, counts) ->
      Map.update(counts, word, 1, &(&1 + 1))
    end)
  end
end
