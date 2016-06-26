defmodule Shipbit.GameControllerTest do
  use Shipbit.ConnCase

  alias Shipbit.Game
  @valid_attrs %{release_date: "2010-04-17 14:00:00", title: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, game_path(conn, :index)
    assert json_response(conn, 200)["games"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    game = Repo.insert! %Game{}
    conn = get conn, game_path(conn, :show, game)
    assert json_response(conn, 200)["data"] == %{"id" => game.id,
      "title" => game.title,
      "release_date" => game.release_date}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, game_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, game_path(conn, :create), game: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Game, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, game_path(conn, :create), game: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    game = Repo.insert! %Game{}
    conn = put conn, game_path(conn, :update, game), game: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Game, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    game = Repo.insert! %Game{}
    conn = put conn, game_path(conn, :update, game), game: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    game = Repo.insert! %Game{}
    conn = delete conn, game_path(conn, :delete, game)
    assert response(conn, 204)
    refute Repo.get(Game, game.id)
  end
end
