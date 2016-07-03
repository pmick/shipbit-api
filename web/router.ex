defmodule Shipbit.Router do
  use Shipbit.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shipbit do
    pipe_through :api

    get "/", PageController, :index
    get "/games", GameController, :index
    post "/games", GameController, :merge
  end

end
