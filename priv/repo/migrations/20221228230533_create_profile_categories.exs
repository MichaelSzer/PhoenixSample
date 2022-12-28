defmodule PhoenixSample.Repo.Migrations.CreateProfileCategories do
  use Ecto.Migration

  def change do
    create table(:profile_categories, primary_key: false) do
      add :profile_id, references(:profiles, on_delete: :delete_all)
      add :category_id, references(:categories, on_delete: :delete_all)
    end

    create index(:profile_categories, [:profile_id])
    create index(:profile_categories, [:category_id])
    create unique_index(:profile_categories, [:profile_id, :category_id])
  end
end
