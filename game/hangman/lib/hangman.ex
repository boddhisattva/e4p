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

  alias Hangman.Game

  defdelegate new_game(), to: Game
end
