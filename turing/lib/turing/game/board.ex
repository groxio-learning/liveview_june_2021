defmodule Turing.Game.Board do

  defstruct [answer: [1, 2, 3, 4], moves: []]

  def new(answer \\ [1, 2, 3, 4]) do
    __struct__(answer: answer)
  end

  def make_move(board, move) do
    %{board| moves: [move|board.moves]}
  end

#make_move = fn board, move -> %{board| moves: [move|board.moves]} end
#new = fn answer -> %{answer: answer, moves: []} end
end
