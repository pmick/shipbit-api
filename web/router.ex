defmodule Shipbit.Router do
  use Shipbit.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Shipbit do
    pipe_through :api

    get "/", PageController, :index
    resources "/games", GameController, except: [:new, :edit]
  end

end
