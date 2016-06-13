defmodule Shipbit.PageController do
  use Shipbit.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
