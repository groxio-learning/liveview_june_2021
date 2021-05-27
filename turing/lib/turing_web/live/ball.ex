defmodule TuringWeb.Ball do
  use Surface.Component

  prop name, :string, required: true

  def render(assigns) do
    ~H"""
    <button phx-click="choose" phx-value-ball="{{@name}}">{{@name}}</button>
    """
  end
end
