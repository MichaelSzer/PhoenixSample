defmodule PhoenixSample.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :social_media, :string
      add :handle_name, :string
      add :tags, :string

      timestamps()
    end
  end
end
