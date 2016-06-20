defmodule Shipbit.ApiUtil do
  @version 2.0
  def version, do: @version

  def send_success(conn, data \\ %{}) do
    Phoenix.Controller.json(conn, data)
  end
end
