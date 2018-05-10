defmodule Dictionary.WordList do
  @moduledoc """
  Documentation for WordList.
  """

  def random_word(word_list) do
    Enum.random(word_list)
  end

  def word_list do
    "../../assets/words.txt"
    |> Path.expand(__DIR__)
    |> File.read!()
    |> String.split(~r/\n/)
  end
end
