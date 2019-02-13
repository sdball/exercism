defmodule PigLatin do
  @vowels [?A, ?E, ?I, ?O, ?U, ?a, ?e, ?i, ?o, ?u]
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(&do_translate/1)
    |> Enum.join(" ")
  end

  def do_translate(phrase = <<leading, _rest::binary>>) when leading in @vowels do
    phrase <> "ay"
  end

  def do_translate(phrase = <<first, second, rest::binary>>) when first in [?x, ?X, ?y, ?Y] do
    if second in @vowels do
      <<second>> <> rest <> <<first>> <> "ay"
    else
      phrase <> "ay"
    end
  end

  def do_translate(<<first, second, rest::binary>>) when first in [?q, ?Q] and second in [?u, ?U] do
    rest <> <<first>> <> <<second>> <> "ay"
  end

  def do_translate(<<consonant, rest::binary>>) do
    do_translate(consonant, rest, [])
  end

  def do_translate(consonant, <<leading, rest::binary>>, leading_consonants) when consonant in [?q, ?Q] and leading in [?u, ?U] do
    rest <> Enum.join(Enum.reverse(leading_consonants)) <> <<consonant>> <> <<leading>> <> "ay"
  end

  def do_translate(consonant, phrase = <<leading, _rest::binary>>, leading_consonants) when leading in @vowels do
    do_translate(phrase <> Enum.join(Enum.reverse([[consonant] | leading_consonants])))
  end

  def do_translate(consonant, <<leading, rest::binary>>, leading_consonants) do
    do_translate(leading, rest, [[consonant] | leading_consonants])
  end
end
