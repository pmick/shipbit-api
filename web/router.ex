defmodule Shipbit.Router do
  use Shipbit.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shipbit do
    pipe_through :api

    get "/", PageController, :index
    get "/games", GameController, :get_all_games
    post "/games", GameController, :update_or_create_games
  end

end
