defmodule TuringWeb.Guess do
  use Surface.Component

  prop balls, :list, required: true

  def render(assigns) do
    ~H"""
    <pre>{{ inspect @balls }}</pre>
    """
  end
end
