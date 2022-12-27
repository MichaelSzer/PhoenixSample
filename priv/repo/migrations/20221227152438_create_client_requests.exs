defmodule PhoenixSample.Repo.Migrations.CreateClientRequests do
  use Ecto.Migration

  def change do
    create table(:client_requests) do
      add :name, :string
      add :email, :string
      add :location, :string
      add :description, :string

      timestamps()
    end
  end
end
