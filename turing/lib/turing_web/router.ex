defmodule TuringWeb.Router do
  use TuringWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TuringWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TuringWeb do
    pipe_through :browser

    live "/video_games", VideoGameLive.Index, :index
    live "/video_games/new", VideoGameLive.Index, :new
    live "/video_games/:id/edit", VideoGameLive.Index, :edit

    live "/video_games/:id", VideoGameLive.Show, :show
    live "/video_games/:id/show/edit", VideoGameLive.Show, :edit

    live "/game", GameLive
    live "/counter/:value", CountLive, :index
    live "/", PageLive, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TuringWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: TuringWeb.Telemetry
    end
  end
end
