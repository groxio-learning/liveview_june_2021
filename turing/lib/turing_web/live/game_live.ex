defmodule TuringWeb.GameLive do
  use TuringWeb, :live_view
  alias Turing.Game.Board

  # socket is actually this struct: %Socket{assigns: %{live_action: :index}}

  # Constructor function: instantiates new socket
  def mount(_params, _session, socket) do
    socket =
      socket
      |> new_board()
      |> show()
    {:ok, socket}
  end

  def new_board(socket) do
    assign(socket, board: Board.new([1, 2, 3, 4]))
  end

  def show(socket) do
    assign(socket, game: Board.show(socket.assigns.board))
  end

  def render(assigns) do
    ~L"""
    <h1>Turing Game</h1>
    <pre><%= inspect @board %></pre>
    <pre><%= inspect @game %></pre>
    """
  end

end
