defmodule TuringWeb.CountLive do
  use TuringWeb, :live_view
  alias Turing.Counter

  # socket is actually this struct: %Socket{assigns: %{live_action: :index}}

  # Constructor function: instantiates new socket
  def mount(%{"value" => value}, _session, socket) do
    {:ok, assign(socket, count: Counter.new(value))}
  end

  # %Socket{assigns: %{live_action: :index, count: 42}}
  #  Reducer function
  def handle_event("inc", _, socket) do
    {:noreply, inc(socket)}
  end

  def inc(socket) do
    assign socket, count: Counter.increment(socket.assigns.count)
  end

  #          function
  def render(assigns) do
    ~L"""
    <h1><%= Counter.show(@count) %></h1>
    <button phx-click="inc">Increment</button>
    """
  end

end
