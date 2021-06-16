defmodule TuringWeb.VideoGameLive.Index do
  use TuringWeb, :live_view

  alias Turing.Arcade
  alias Turing.Arcade.VideoGame

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :video_games, list_video_games())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Video game")
    |> assign(:video_game, Arcade.get_video_game!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Video game")
    |> assign(:video_game, %VideoGame{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Video games")
    |> assign(:video_game, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    video_game = Arcade.get_video_game!(id)
    {:ok, _} = Arcade.delete_video_game(video_game)

    {:noreply, assign(socket, :video_games, list_video_games())}
  end

  defp list_video_games do
    Arcade.list_video_games()
  end
end
