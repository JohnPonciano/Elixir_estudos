defmodule ExMonTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  alias ExMon.Player

  describe("create_player/4") do
    test "returns a player" do
      expected_response = %Player{
        name: "John",
        life: 100,
        moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute}
      }

      assert expected_response = ExMon.create_player("John", :chute, :soco, :cura)
    end
  end

  describe("start_game/1") do
    test "When game start return message" do
      player = Player.build("John", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "status: :started"
      assert messages =~ "turn: :player"
    end
  end

  describe("make_move/1") do
    test "When valid movement" do
      player = Player.build("John", :chute, :soco, :cura)
      

    end
  end
end
