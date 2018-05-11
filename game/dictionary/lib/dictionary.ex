defmodule Dictionary do
  @moduledoc """
  Documentation for Dictionary.
  """

  @doc """
  Generate a random word from a text file(assets/words.txt) that serves as a dictionary

  ## Examples

      iex> Dictionary.random_word
      "truth"

  """
  alias Dictionary.WordList

  defdelegate random_word(), to: WordList
end
