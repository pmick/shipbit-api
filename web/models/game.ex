defmodule Shipbit.Game do
  use Shipbit.Web, :model

  schema "games" do
    field :title, :string
    field :release_date, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(title release_date)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:title)
  end
end
