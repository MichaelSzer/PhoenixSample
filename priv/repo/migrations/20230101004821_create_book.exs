defmodule PhoenixSample.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :title, :string, primary_key: true
      add :author, references(:authors, on_delete: :delete_all, column: :name, type: :string)
    end

    unique_index(:books, [:title])
  end
end
