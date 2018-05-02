defmodule Dictionary do
  @moduledoc """
  Documentation for Dictionary.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Dictionary.hello
      :world

  """

  def random_word do
    Enum.random(word_list())
  end

  def word_list do
    contents = File.read!("assets/words.txt")
    words = String.split(contents, ~r/\n/)
  end
end
