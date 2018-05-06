defmodule Hangman.Game do
  @moduledoc """
  Documentation for Hangman.
  """

  defstruct(
    turns_left: 7,
    game_state: "initializing",
    letters: []
    )

  @doc """
  Starting a new Hangman game
  ## Examples
      iex> Hangman.new_game
      %Hangman.Game{
        game_state: "initializing",
        letters: ["m", "o", "t", "i", "v", "a", "t", "e", "d"],
        turns__left: 7
      }
}
  """

  def new_game do
    %Hangman.Game{
      letters: Dictionary.random_word |> String.codepoints
    }
  end
end