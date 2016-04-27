defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
      |> clean_sentence
      |> String.split |> count_words
  end

  def count_words(words) do
    Enum.reduce words, %{}, &update_counts/2
  end

  def update_counts(word, counts) do
    Map.update(counts, word, 1, &add_one/1)
  end

  def add_one(x), do: x + 1

  def normalize_case(word), do: String.downcase(word)

  def strip_punctuation(sentence) do
    String.replace(sentence, ~r/[!@#$%^&*()+=;:'',.<>]+/, "")
  end

  def replace_underscores(sentence), do: String.replace(sentence, ~r/_/, " ")

  def clean_sentence(sentence) do
    sentence
     |> strip_punctuation
     |> replace_underscores
     |> normalize_case
  end
end
