defmodule PhoenixSample.Repo.Migrations.CreateBook do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :title, :string
      add :author, references(:authors, on_delete: :delete_all), primary_key: true
    end

    unique_index(:books, [:title])
  end
end
