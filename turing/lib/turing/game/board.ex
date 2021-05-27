defmodule Turing.Game.Board do
  alias Turing.Game.Score
  defstruct [answer: [1, 2, 3, 4], moves: []]

  def new(answer) do
    __struct__(answer: answer)
  end

  def make_move(board, move) do
    %{board| moves: [move|board.moves]}
  end

  def show(board) do
    %{rows: build_rows(board), status: build_status(board)}
  end

  defp build_rows(board) do
    board.moves
    |> Enum.map(fn guess ->
        %{score: Score.new(guess, board.answer), guess: guess}
    end)
  end

  defp build_status(board) do
    board
  end
#make_move = fn board, move -> %{board| moves: [move|board.moves]} end
#new = fn answer -> %{answer: answer, moves: []} end
end
