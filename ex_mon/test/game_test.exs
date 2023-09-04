defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  describe("start/2") do

    test "start the game state" do
      player = Player.build("John", :chute, :soco, :cura)
      computer = Player.build("John", :chute, :soco, :cura)

      assert {:ok, _pid} = Game.start(player, computer)
    end
  end

  describe "info/0" do
    test "return the current game state" do
      player = Player.build("John", :chute, :soco, :cura)
      computer = Player.build("Robotinik", :kick, :punch, :heal)

      Game.start(player, computer)

      expected_response = %{status: :started,
      player: %ExMon.Player{life: 100, name: "Robotinik", moves:
      %{move_avg: :punch, move_heal: :heal, move_rnd: :kick}},
      computer: %ExMon.Player{life: 100, name: "John", moves:
      %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}}, turn: :player}


      assert expected_response == Game.info()
    end
  end
end
