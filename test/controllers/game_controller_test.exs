defmodule Shipbit.GameControllerTest do
  use Shipbit.ConnCase

  alias Shipbit.Game
  @valid_attrs %{release_date: "2010-04-17 14:00:00", title: "some content"}
  @second_valid_attrs %{release_date: "2011-04-17 14:00:00", title: "some content 2"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, game_path(conn, :index)
    assert json_response(conn, 200)["games"] == []
  end

  test "lists one game if one exists on index", %{conn: conn} do
    game = Repo.insert! %Game{}
    conn = get conn, game_path(conn, :index)
    assert json_response(conn, 200)["games"] == [%{
      "title" => game.title,
      "release_date" => game.release_date}]
  end

  test "creates no games for an empty array" do
    conn = post conn, game_path(conn, :merge), games: []
    assert Repo.all(Game) == []
  end

  test "creates a game for an array with a single game" do
    conn = post conn, game_path(conn, :merge), games: [@valid_attrs]
    assert Repo.get_by(Game, @valid_attrs)
  end

  test "creates multiple games for an array with 2 games" do
    conn = post conn, game_path(conn, :merge), games: [@valid_attrs, @second_valid_attrs]
    assert Repo.get_by(Game, @valid_attrs)
    assert Repo.get_by(Game, @second_valid_attrs)
  end

  test "updates an existing game rather than making a duplicate" do
    # Fails because of how the sandbox transactions work for postgres
    # https://github.com/elixir-ecto/ecto/issues/1459
    #
    # game = Repo.insert! %Game{title: "some content"}
    # conn = post conn, game_path(conn, :merge), games: [@valid_attrs]
    # query = from g in Game,
    #      where: g.title == "some content",
    #      select: g
    # games = Repo.all(query)
    # assert length(games) == 1
  end
end
