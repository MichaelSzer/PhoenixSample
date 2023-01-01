defmodule PhoenixSample.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :social_media, :string, null: false
      add :handle_name, :string, null: false
      add :views, :integer, default: 0

      timestamps()
    end
  end
end
