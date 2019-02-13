defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) when is_binary(rna) do
    rna
    |> rna_string_to_codons
    |> codons_to_proteins
  end

  defp rna_string_to_codons(rna) do
    rna
    |> String.to_charlist
    |> Enum.chunk_every(3)
    |> Enum.map(&IO.chardata_to_string/1)
  end

  defp codons_to_proteins(codons) do
      codons_to_proteins([], codons)
  end
  defp codons_to_proteins(proteins, []) do
    {:ok, Enum.reverse(proteins)}
  end
  defp codons_to_proteins(proteins, [codon | codons]) do
    case of_codon(codon) do
      {:ok, "STOP"} -> codons_to_proteins(proteins, [])
      {:ok, protein} -> codons_to_proteins([protein | proteins], codons)
      {:error, _} -> {:error, "invalid RNA"}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon("UGU") do
    {:ok, "Cysteine"}
  end
  def of_codon("UGC") do
    {:ok, "Cysteine"}
  end
  def of_codon("UUA") do
    {:ok, "Leucine"}
  end
  def of_codon("UUG") do
    {:ok, "Leucine"}
  end
  def of_codon("AUG") do
    {:ok, "Methionine"}
  end
  def of_codon("UUU") do
    {:ok, "Phenylalanine"}
  end
  def of_codon("UUC") do
    {:ok, "Phenylalanine"}
  end
  def of_codon("UCU") do
    {:ok, "Serine"}
  end
  def of_codon("UCC") do
    {:ok, "Serine"}
  end
  def of_codon("UCA") do
    {:ok, "Serine"}
  end
  def of_codon("UCG") do
    {:ok, "Serine"}
  end
  def of_codon("UGG") do
    {:ok, "Tryptophan"}
  end
  def of_codon("UAU") do
    {:ok, "Tyrosine"}
  end
  def of_codon("UAC") do
    {:ok, "Tyrosine"}
  end
  def of_codon("UAA") do
    {:ok, "STOP"}
  end
  def of_codon("UAG") do
    {:ok, "STOP"}
  end
  def of_codon("UGA") do
    {:ok, "STOP"}
  end
  def of_codon(_) do
    {:error, "invalid codon"}
  end
end
