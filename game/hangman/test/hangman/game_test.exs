defmodule GameTest do
  use ExUnit.Case

  alias Hangman.Game

  test "New Hangman game related structure" do

    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == "initializing"
    assert length(game.letters) > 0
  end

  test "state isn't changed for :won game" do
    game = Game.new_game()
           |> Map.put(:game_state, :won)
    assert { ^game, _ } = Game.make_move(game, "x")
  end
end