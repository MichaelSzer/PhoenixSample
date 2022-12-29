defmodule PhoenixSample.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :user_email, :string

      timestamps()
    end

    create unique_index(:carts, [:user_email])
  end
end
