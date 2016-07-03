defmodule Shipbit.GameView do
  use Shipbit.Web, :view

  def render("index.json", %{games: games}) do
    %{games: render_many(games, Shipbit.GameView, "game.json")}
  end

  def render("show.json", %{game: game}) do
    %{data: render_one(game, Shipbit.GameView, "game.json")}
  end

  def render("game.json", %{game: game}) do
    %{title: game.title,
      release_date: game.release_date}
  end
end
