defmodule TuringWeb.GameLive do
  use TuringWeb, :live_view
  use Surface.Component

  alias Turing.Game
  alias Turing.Game.{Board, Move}
  alias TuringWeb.{Turn, Ball, GameBoard, Guess}

  # socket is actually this struct: %Socket{assigns: %{live_action: :index}}

  # Constructor function: instantiates new socket
  def mount(_params, _session, socket) do
    socket =
      socket
      |> new_board()
      |> build_move()
      |> show()
    {:ok, socket}
  end

  def new_board(socket) do
    assign(socket, board: Game.new_board())
  end

  def build_move(socket) do
    assign(socket, move: Move.new())
  end

  def make_move(socket) do
    assign(socket, board: Game.guess(socket.assigns.board, socket.assigns.move))
  end

  def choose(socket, ball) do
    assign(socket, move: Game.choose(socket.assigns.move, ball))
  end

  def show(socket) do
    assign(socket, game: Board.show(socket.assigns.board))
  end

  def render_score(%{reds: reds, whites: whites}) do
    left = List.duplicate("R", reds) |> Enum.join()
    right = List.duplicate("W", whites) |> Enum.join()
    left <> right
  end

  def render_guess(guess), do: inspect guess

  def render(assigns) do
    ~H"""
    <h1>Turing Game</h1>
    <GameBoard game = {{ assigns.game }} />
    <Guess balls = {{ assigns.move }} />
    <Turn/>
    <Ball name = "1"/>
    <Ball name = "2"/>
    <Ball name = "3"/>
    <Ball name = "4"/>
    <Ball name = "5"/>
    <Ball name = "6"/>
    <Ball name = "7"/>
    <Ball name = "8"/>
    """
  end

  def handle_event("guess", _, socket) do
    {:noreply, socket |> make_move() |> show() |> build_move()}
  end

  def handle_event("choose", %{"ball" => ball}, socket) do
    {:noreply, socket |> choose(ball)}
  end

end
