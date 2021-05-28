defmodule Turing.Arcade do
  @moduledoc """
  The Arcade context.
  """

  import Ecto.Query, warn: false
  alias Turing.Repo

  alias Turing.Arcade.VideoGame

  @doc """
  Returns the list of video_games.

  ## Examples

      iex> list_video_games()
      [%VideoGame{}, ...]

  """
  def list_video_games do
    Repo.all(VideoGame)
  end

  @doc """
  Gets a single video_game.

  Raises `Ecto.NoResultsError` if the Video game does not exist.

  ## Examples

      iex> get_video_game!(123)
      %VideoGame{}

      iex> get_video_game!(456)
      ** (Ecto.NoResultsError)

  """
  def get_video_game!(id), do: Repo.get!(VideoGame, id)

  @doc """
  Creates a video_game.

  ## Examples

      iex> create_video_game(%{field: value})
      {:ok, %VideoGame{}}

      iex> create_video_game(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_video_game(attrs \\ %{}) do
    %VideoGame{}
    |> VideoGame.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a video_game.

  ## Examples

      iex> update_video_game(video_game, %{field: new_value})
      {:ok, %VideoGame{}}

      iex> update_video_game(video_game, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_video_game(%VideoGame{} = video_game, attrs) do
    video_game
    |> VideoGame.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a video_game.

  ## Examples

      iex> delete_video_game(video_game)
      {:ok, %VideoGame{}}

      iex> delete_video_game(video_game)
      {:error, %Ecto.Changeset{}}

  """
  def delete_video_game(%VideoGame{} = video_game) do
    Repo.delete(video_game)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking video_game changes.

  ## Examples

      iex> change_video_game(video_game)
      %Ecto.Changeset{data: %VideoGame{}}

  """
  def change_video_game(%VideoGame{} = video_game, attrs \\ %{}) do
    VideoGame.changeset(video_game, attrs)
  end
end
