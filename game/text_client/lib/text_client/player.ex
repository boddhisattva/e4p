defmodule TextClient.Player do
  alias TextClient.{Prompter, State, Summary}

  def play(%State{tally: %{ game_state: :won}}) do
    exit_with_message("You Won!")
  end

  def play(%State{tally: %{ game_state: :lost}}) do
    exit_with_message("Sorry, you lost")
  end

  def play(game = %State{tally: %{ game_state: :good_guess}}) do
    continue_with_message(game, "Good guess!")
  end

  def play(game = %State{tally: %{ game_state: :bad_guess}}) do
    continue_with_message(game, "Sorry, that isn't in the word")
  end

  def play(game = %State{tally: %{ game_state: :already_used}}) do
    continue_with_message(game, "You've already used that letter")
  end

  @moduledoc """
  If the state of the game is anything other than the states - won, lost, good_guess, bad_guess, already_used
  What this basically does is, it kicks the game off..

  Please note in general, play is indirectly a recursive function.
  """
  def play(game) do
    continue(game)
  end

  def continue_with_message(game, message) do
    IO.puts(message)
    continue(game)
  end

  def continue(game) do
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> make_move()
    |> play()
  end

  def display(game) do
    game
  end

  def prompt(game) do
    game
  end

  def make_move(game) do
    game
  end

  defp exit_with_message(msg) do
    IO.puts(msg)
    exit(:normal)
  end
end