defmodule Turing.Arcade.VideoGame do
  use Ecto.Schema
  import Ecto.Changeset

  schema "video_games" do
    field :name, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(video_game, attrs) do
    video_game
    |> cast(attrs, [:name, :year])
    |> validate_required([:name, :year])
    |> validate_number(:year, greater_than: 1971)
  end
end
