defmodule Shipbit.Repo.Migrations.AddDatesToUsers do
  use Ecto.Migration

  def change do
    alter table(:games) do
      add :release_date, :datetime

      timestamps
    end
  end
end
