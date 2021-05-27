defmodule TuringWeb.Turn do
  use Surface.Component

  def render(assigns) do
    ~H"""
    <button phx-click="guess">Guess</button>
    """
  end
end
