defmodule Hangman do
  @moduledoc """
  Documentation for Hangman.
  """

  @doc """
  Starting a new Hangman game
  ## Examples
      iex> Hangman.new_game
      Hello from the Hangman Game
  """

  def new_game do
    Hangman.Game.new_game()
  end
end
