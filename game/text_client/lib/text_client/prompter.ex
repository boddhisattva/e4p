defmodule TextClient.Prompter do
  def accept_move(game) do
    check_input(IO.gets("Your guess: "), game)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Game ended: #{reason}")
    exit(:normal)
  end

  defp check_input({:error, reason}, _) do
    IO.puts("Looks like you gave up..")
    exit(:normal)
  end

  defp check_input(input, game) do
    input = String.trim(input)
    cond do
      input =~ ~r/\A[a-z]\z/ ->
        Map.put(game, :guess, input) #if good input, guess is added
      true ->
        IO.puts "please enter a single lowercase letter"
        accept_move(game)
    end
  end
end
