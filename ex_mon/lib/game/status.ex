defmodule ExMon.Game.Status do

  def print_round_message(%{status: :started} = info) do
    IO.puts("\n==== Game STARTED ====\n")
    IO.inspect(info)
    IO.puts("-----------------------------------")
  end

  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n==== Change! is a #{player}  turn ====\n")
    IO.inspect(info)
    IO.puts("-----------------------------------")
  end

  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n==== Game OVER ====\n")
    IO.inspect(info)
    IO.puts("-----------------------------------")
  end

  def print_wrong_move_message(move) do
    IO.puts("\n==== INVALID MOVE : #{move} ====\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n==== Player has attacked the Computer caused #{damage} damage!!!. ====\n")
  end

  def print_move_message(:player, :attack, damage) do
    IO.puts("\n==== Computer has attacked the Player #{damage} damage!!!. ====\n")
  end

  def print_move_message(player, :heal, life) do
    IO.puts("\n==== #{player} has healing in #{life} points!!!. ====\n")
  end
end
