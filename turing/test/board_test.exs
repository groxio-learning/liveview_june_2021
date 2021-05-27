defmodule Turing.BoardTest do
  use ExUnit.Case

  alias Turing.Game.Board

  test "is the board a won game" do
    board = Board.new([1,2,3,4])
    board = Board.make_move(board, [1,2,3,4])
    assert Board.show(board).status == :won
  end

end
