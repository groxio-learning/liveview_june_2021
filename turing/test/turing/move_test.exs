defmodule Turing.MoveTest do
  use ExUnit.Case

  alias Turing.Game.Move

  test "moves can be made/ created" do
    assert Move.new == []
  end

  test "moves can be added" do
    balls = Move.new |> Move.add(1)

    assert balls == [1]
  end
end
