defmodule PhoenixSample.Repo.Migrations.CreateAuthor do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string
    end

    unique_index(:authors, [:name])
  end
end
