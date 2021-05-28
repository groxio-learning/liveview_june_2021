# <pre>
# <%= for row <- @game.rows do %>
#   <%= render_guess(row.guess) %><%= render_score(row.score) %>
# <% end %>
# </pre>


defmodule TuringWeb.GameBoard do
  use Surface.Component

  prop game, :any, required: true

  def render(assigns) do
    ~H"""
      <pre> {{ inspect @game.status }}</pre>
      <pre>{{ inspect @game }}</pre>
    """
  end
end
