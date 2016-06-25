defmodule Shipbit.Repo.Migrations.CreateGamesTable do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :summary, :text
      add :publisher, :string
      add :link_path, :string
      add :genre, :string
      add :esrb, :string
      add :developer, :string
      add :critic_score, :integer
      add :art_path, :string
    end

    create index(:games, [:title], unique: true)
  end
end
