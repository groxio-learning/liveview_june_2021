defmodule TuringWeb.VideoGameLive.FormComponent do
  use TuringWeb, :live_component

  alias Turing.Arcade

  @impl true
  def update(%{video_game: video_game} = assigns, socket) do
    changeset = Arcade.change_video_game(video_game)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"video_game" => video_game_params}, socket) do
    changeset =
      socket.assigns.video_game
      |> Arcade.change_video_game(video_game_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"video_game" => video_game_params}, socket) do
    save_video_game(socket, socket.assigns.action, video_game_params)
  end

  defp save_video_game(socket, :edit, video_game_params) do
    case Arcade.update_video_game(socket.assigns.video_game, video_game_params) do
      {:ok, _video_game} ->
        {:noreply,
         socket
         |> put_flash(:info, "Video game updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_video_game(socket, :new, video_game_params) do
    case Arcade.create_video_game(video_game_params) do
      {:ok, _video_game} ->
        {:noreply,
         socket
         |> put_flash(:info, "Video game created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
