defmodule Shipbit.PageController do
  use Shipbit.Web, :controller

  def index(conn, _params) do
    conn |>
      Shipbit.ApiUtil.send_success(%{"version" => Shipbit.ApiUtil.version})
  end
end
