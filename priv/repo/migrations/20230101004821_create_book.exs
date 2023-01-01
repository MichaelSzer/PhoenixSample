defmodule PhoenixSample.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :author, references(:authors, on_delete: :delete_all)
    end

    unique_index(:books, [:title])
  end
end
