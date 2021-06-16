defmodule Turing.Repo.Migrations.CreateVideoGames do
  use Ecto.Migration

  def change do
    create table(:video_games) do
      add :name, :string
      add :year, :integer

      timestamps()
    end

  end
end
