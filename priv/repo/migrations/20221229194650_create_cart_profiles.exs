defmodule PhoenixSample.Repo.Migrations.CreateCartProfiles do
  use Ecto.Migration

  def change do
    create table(:cart_profiles) do
      add :price_when_carted, :decimal, precision: 15, scale: 6, null: false
      add :quantity, :integer
      add :cart_id, references(:carts, on_delete: :delete_all)
      add :profile_id, references(:profiles, on_delete: :delete_all)

      timestamps()
    end

    create index(:cart_profiles, [:cart_id])
    create index(:cart_profiles, [:profile_id])
    create unique_index(:cart_profiles, [:cart_id, :profile_id])
  end
end
