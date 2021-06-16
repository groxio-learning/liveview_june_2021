defmodule TuringWeb.VideoGameLiveTest do
  use TuringWeb.ConnCase

  import Phoenix.LiveViewTest

  alias Turing.Arcade

  @create_attrs %{name: "some name", year: 42}
  @update_attrs %{name: "some updated name", year: 43}
  @invalid_attrs %{name: nil, year: nil}

  defp fixture(:video_game) do
    {:ok, video_game} = Arcade.create_video_game(@create_attrs)
    video_game
  end

  defp create_video_game(_) do
    video_game = fixture(:video_game)
    %{video_game: video_game}
  end

  describe "Index" do
    setup [:create_video_game]

    test "lists all video_games", %{conn: conn, video_game: video_game} do
      {:ok, _index_live, html} = live(conn, Routes.video_game_index_path(conn, :index))

      assert html =~ "Listing Video games"
      assert html =~ video_game.name
    end

    test "saves new video_game", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.video_game_index_path(conn, :index))

      assert index_live |> element("a", "New Video game") |> render_click() =~
               "New Video game"

      assert_patch(index_live, Routes.video_game_index_path(conn, :new))

      assert index_live
             |> form("#video_game-form", video_game: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#video_game-form", video_game: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.video_game_index_path(conn, :index))

      assert html =~ "Video game created successfully"
      assert html =~ "some name"
    end

    test "updates video_game in listing", %{conn: conn, video_game: video_game} do
      {:ok, index_live, _html} = live(conn, Routes.video_game_index_path(conn, :index))

      assert index_live |> element("#video_game-#{video_game.id} a", "Edit") |> render_click() =~
               "Edit Video game"

      assert_patch(index_live, Routes.video_game_index_path(conn, :edit, video_game))

      assert index_live
             |> form("#video_game-form", video_game: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#video_game-form", video_game: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.video_game_index_path(conn, :index))

      assert html =~ "Video game updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes video_game in listing", %{conn: conn, video_game: video_game} do
      {:ok, index_live, _html} = live(conn, Routes.video_game_index_path(conn, :index))

      assert index_live |> element("#video_game-#{video_game.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#video_game-#{video_game.id}")
    end
  end

  describe "Show" do
    setup [:create_video_game]

    test "displays video_game", %{conn: conn, video_game: video_game} do
      {:ok, _show_live, html} = live(conn, Routes.video_game_show_path(conn, :show, video_game))

      assert html =~ "Show Video game"
      assert html =~ video_game.name
    end

    test "updates video_game within modal", %{conn: conn, video_game: video_game} do
      {:ok, show_live, _html} = live(conn, Routes.video_game_show_path(conn, :show, video_game))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Video game"

      assert_patch(show_live, Routes.video_game_show_path(conn, :edit, video_game))

      assert show_live
             |> form("#video_game-form", video_game: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#video_game-form", video_game: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.video_game_show_path(conn, :show, video_game))

      assert html =~ "Video game updated successfully"
      assert html =~ "some updated name"
    end
  end
end
