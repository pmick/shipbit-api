defmodule Shipbit.Repo.Migrations.CreateGame do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :release_date, :datetime

      timestamps
    end

    create unique_index(:games, [:title])
  end
end
