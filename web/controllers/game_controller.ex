defmodule Shipbit.GameController do
  use Shipbit.Web, :controller

  alias Shipbit.Game

  plug :scrub_params, "games" when action in [:merge]

  def index(conn, _params) do
    games = Repo.all(Game)
    render(conn, "index.json", games: games)
  end

  def merge(conn, %{"games" => games}) do
    Enum.each(games, fn game -> find_or_create(game) end)
    send_resp(conn, :no_content, "")
  end

  defp find_or_create(game) do
    changeset = Game.changeset(%Game{}, game)
    case Repo.insert_or_update(changeset) do
      {:ok, game} -> game
      {:error, changeset} -> changeset
    end
  end
end
