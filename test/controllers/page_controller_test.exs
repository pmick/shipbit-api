defmodule Shipbit.PageControllerTest do
  use Shipbit.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert json_response(conn, 200) == %{"version" => 2.0}
  end
end
