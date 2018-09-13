defmodule Shorten.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :code, :string

      timestamps()
    end

  end
end
