defmodule Shipbit.GameController do
  use Shipbit.Web, :controller

  alias Shipbit.Game

  plug :scrub_params, "games" when action in [:merge]

  def index(conn, _params) do
    games = Repo.all(Game)
    render(conn, "index.json", games: games)
  end

  def merge(conn, %{"games" => games}) do
    # this could be converted into 3 sql statements rather than 2 per game
    # also look into upsert in postgres
    Enum.each(games, fn game -> find_or_create(game) end)
    send_resp(conn, :no_content, "")
  end

  defp find_or_create(game) do
    existing_game = Repo.get_by(Game, title: game["title"])
    upsert(existing_game, game)
  end

  defp upsert(existing_game, game_params) when is_nil(existing_game) do
    changeset = Game.changeset(%Game{}, game_params)
    case Repo.insert(changeset) do
      {:ok, game} -> game
      {:error, changeset} -> changeset
    end
  end

  defp upsert(existing_game, game_params) do
    changeset = Game.changeset(existing_game, game_params)
    case Repo.update(changeset) do
      {:ok, game} -> game
      {:error, changeset} -> changeset
    end
  end
end
