defmodule Dictionary do
  @moduledoc """
  Documentation for Dictionary.
  """

  @doc """
  Generate a random word from a text file(assets/words.txt) that serves as a dictionary

  ## Examples

      iex> Dictionary.random_word
      "contributors"

  """
  alias Dictionary.WordList

  defdelegate start(), to: WordList, as: :word_list
  defdelegate random_word(word_list), to: WordList
end
