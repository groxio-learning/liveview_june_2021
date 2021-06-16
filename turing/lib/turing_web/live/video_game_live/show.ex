defmodule TuringWeb.VideoGameLive.Show do
  use TuringWeb, :live_view

  alias Turing.Arcade

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:video_game, Arcade.get_video_game!(id))}
  end

  defp page_title(:show), do: "Show Video game"
  defp page_title(:edit), do: "Edit Video game"
end
