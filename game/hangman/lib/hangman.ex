defmodule Hangman do
  @moduledoc """
  Documentation for Hangman.
  """

  alias Hangman.Game

  @doc """
  Starting a new Hangman game
  ## Examples
      iex> Hangman.new_game
      Hello from the Hangman Game
  """
  defdelegate new_game(), to: Game
end
