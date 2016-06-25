defmodule Shipbit.GameController do

  def get_all_games(conn, _) do
    conn |>
      Shipbit.ApiUtil.send_success(%{"games" => "test"})
  end

  def update_or_create_games(conn, _) do

  end
end
