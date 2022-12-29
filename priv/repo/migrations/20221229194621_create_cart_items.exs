defmodule PhoenixSample.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

  def change do
    create table(:cart_items) do
      add :price_when_carted, :decimal
      add :quantity, :integer
      add :cart_id, references(:carts, on_delete: :nothing)
      add :profiles_id, references(:profiles, on_delete: :nothing)

      timestamps()
    end

    create index(:cart_items, [:cart_id])
    create index(:cart_items, [:profiles_id])
  end
end
