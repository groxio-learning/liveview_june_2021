defmodule Turing.Game.Status do
  alias Turing.Game.{Board, Score}

  defstruct [status: :playing, rounds: 0]

  def game_state(move) do
    board = Board.new()
    score = Score.new(move, board.answer)
    # Return value of score e.g. %{reds: 2, whites: 1}
    if score.reds == 4 do
      # Change status to 'won'
      # ...
    else 
      Board.make_move(board, move)
    end
  end

  # def check_status(score, rounds) do
   
  # end

end