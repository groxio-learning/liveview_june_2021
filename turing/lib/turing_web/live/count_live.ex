defmodule TuringWeb.CountLive do
  use TuringWeb, :live_view
  
  # %Socket{assigns: %{live_action: :index}}

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def render(assigns) do
    ~L"""
    <h1>Hello. Your count is <%= @count %>.</h1>
    <button phx-click="inc">Increment</button>
    """
  end

  def handle_event("inc", _, socket) do
    {:noreply, assign(socket, count: 1)}
  end
end