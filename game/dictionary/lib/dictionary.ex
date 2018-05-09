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

  def random_word do
    word_list()
    |> Enum.random()
  end

  def word_list do
    "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
