defmodule Turing.ArcadeTest do
  use Turing.DataCase

  alias Turing.Arcade

  describe "video_games" do
    alias Turing.Arcade.VideoGame

    @valid_attrs %{name: "some name", year: 42}
    @update_attrs %{name: "some updated name", year: 43}
    @invalid_attrs %{name: nil, year: nil}

    def video_game_fixture(attrs \\ %{}) do
      {:ok, video_game} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Arcade.create_video_game()

      video_game
    end

    test "list_video_games/0 returns all video_games" do
      video_game = video_game_fixture()
      assert Arcade.list_video_games() == [video_game]
    end

    test "get_video_game!/1 returns the video_game with given id" do
      video_game = video_game_fixture()
      assert Arcade.get_video_game!(video_game.id) == video_game
    end

    test "create_video_game/1 with valid data creates a video_game" do
      assert {:ok, %VideoGame{} = video_game} = Arcade.create_video_game(@valid_attrs)
      assert video_game.name == "some name"
      assert video_game.year == 42
    end

    test "create_video_game/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Arcade.create_video_game(@invalid_attrs)
    end

    test "update_video_game/2 with valid data updates the video_game" do
      video_game = video_game_fixture()
      assert {:ok, %VideoGame{} = video_game} = Arcade.update_video_game(video_game, @update_attrs)
      assert video_game.name == "some updated name"
      assert video_game.year == 43
    end

    test "update_video_game/2 with invalid data returns error changeset" do
      video_game = video_game_fixture()
      assert {:error, %Ecto.Changeset{}} = Arcade.update_video_game(video_game, @invalid_attrs)
      assert video_game == Arcade.get_video_game!(video_game.id)
    end

    test "delete_video_game/1 deletes the video_game" do
      video_game = video_game_fixture()
      assert {:ok, %VideoGame{}} = Arcade.delete_video_game(video_game)
      assert_raise Ecto.NoResultsError, fn -> Arcade.get_video_game!(video_game.id) end
    end

    test "change_video_game/1 returns a video_game changeset" do
      video_game = video_game_fixture()
      assert %Ecto.Changeset{} = Arcade.change_video_game(video_game)
    end
  end
end
