defmodule Hangman.Game do
  @moduledoc """
  Documentation for Hangman.
  """

  defstruct(
    turns_left: 7,
    game_state: "initializing",
    letters: [],
    used: MapSet.new()
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

  def new_game(word) do
    %Hangman.Game{
      letters: word |> String.codepoints()
    }
  end

  def new_game do
    new_game(Dictionary.random_word())
  end

  @doc """
  {game, _tally} = Game.make_move(game, "z")
  {%Hangman.Game{
     game_state: :bad_guess,
     letters: ["p", "a", "r", "t", "i", "c", "i", "p", "a", "n", "t"],
     turns_left: 5,
     used: #MapSet<["a", "c", "w", "z"]>
   },
   %{
     game_state: :bad_guess,
     letters: ["_", "a", "_", "_", "_", "c", "_", "_", "a", "_", "_"],
     turns_left: 5
   }}
  """
  def make_move(game = %{game_state: state}, _guessed_letter) when state in [:won, :lost] do
    {game, tally(game)}
  end

  def make_move(game, guessed_letter) do
    game = accept_move(game, guessed_letter, MapSet.member?(game.used, guessed_letter))
    {game, tally(game)}
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
    |> score_guess(Enum.member?(game.letters, guessed_letter))
  end

  @doc """
    We’ve won if the letters in the word form a true subset of the letters that are guessed
  """

  def score_guess(game, _good_guess = true) do
    new_state =
      MapSet.new(game.letters)
      |> MapSet.subset?(game.used)
      |> maybe_won()

    Map.put(game, :game_state, new_state)
  end


  def score_guess(game = %{turns_left: 1}, _not_good_guess) do
    Map.put(game, :game_state, :lost)
  end

  def score_guess(game = %{turns_left: turns_left}, _not_good_guess) do
    %{ game | game_state: :bad_guess,
              turns_left: turns_left - 1 }
  end

  def maybe_won(true), do: :won
  def maybe_won(_), do: :good_guess

  def tally(game) do
    %{
      game_state: game.game_state,
      turns_left: game.turns_left,
      letters:    game.letters |> reveal_guessed(game.used)
    }
  end

  def reveal_guessed(letters, used) do
    letters
    |> Enum.map(fn letter -> reveal_letter(letter, MapSet.member?(used, letter)) end)
  end

  def reveal_letter(letter, _in_word = true), do: letter
  def reveal_letter(letter, _not_in_word), do: "_"
end
