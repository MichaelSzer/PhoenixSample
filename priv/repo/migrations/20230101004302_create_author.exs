defmodule PhoenixSample.Repo.Migrations.CreateAuthor do
  use Ecto.Migration


  def change do
    create table(:authors, primary_key: false) do
      add :name, :string, primary_key: true
    end

    unique_index(:authors, [:name])
  end
end
