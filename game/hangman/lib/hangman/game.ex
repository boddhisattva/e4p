defmodule Hangman.Game do
  @moduledoc """
  Documentation for Hangman.
  """

  defstruct(
    turns_left: 7,
    game_state: "initializing",
    letters: [],
    used:    MapSet.new()
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

  def make_move(game = %{game_state: state}, _guessed_letter) when state in [:won, :lost] do
    { game, tally(game) }
  end

  def make_move(game, guessed_letter) do
    require IEx; IEx.pry
    game = accept_move(game, guessed_letter, MapSet.member?(game.used, guessed_letter))
    { game, tally(game) }
  end

  @doc """
  If a letter is already used, we are gonna return a game with the game state of
  already used..
  ## Examples
  iex(3)> Hangman.Game.accept_move(game, guessed_letter, true)
%Hangman.Game{
  game_state: :already_used,
  letters: ["g", "e", "o", "r", "g", "i", "a"],
  turns_left: 7,
  used: #MapSet<[]>
}
  """
  def accept_move(game, guessed_letter, _already_guessed = true) do
    Map.put(game, :game_state, :already_used)
  end

  @doc """
  If not used, we are going to update the list of letters saying that
  we have now used this letter..
  ## Examples
iex(4)> Hangman.Game.accept_move(game, guessed_letter, false)
%Hangman.Game{
  game_state: "initializing",
  letters: ["g", "e", "o", "r", "g", "i", "a"],
  turns_left: 7,
  used: #MapSet<["x"]>
}

  """
  def accept_move(game, guessed_letter, _already_guessed) do
    Map.put(game, :used, MapSet.put(game.used, guessed_letter))
  end


  def tally(game) do
    123
  end
end


