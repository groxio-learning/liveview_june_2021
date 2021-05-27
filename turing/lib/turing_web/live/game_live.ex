defmodule TuringWeb.GameLive do
  use TuringWeb, :live_view
  alias Turing.Game
  alias Turing.Game.{Board, Move}

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
    ~L"""
    <h1>Turing Game</h1>
    <%= for ball <- 1..8 do %>
      <button phx-click="choose" phx-value-ball="<%= ball %>"><%= ball %></button>
    <% end %>
    <button phx-click="guess">Guess</button>
    <pre>
      <%= for row <- @game.rows do %>
        <%= render_guess(row.guess) %><%= render_score(row.score) %>
      <% end %>
    </pre>
    <pre><%= inspect @game.status %></pre>
    <pre><%= inspect @game %></pre>
    <pre><%= inspect @move %></pre>
    """
  end

  def handle_event("guess", _, socket) do
    {:noreply, socket |> make_move() |> show() |> build_move()}
  end 

  def handle_event("choose", %{"ball" => ball}, socket) do
    {:noreply, socket |> choose(ball)}
  end 

end
