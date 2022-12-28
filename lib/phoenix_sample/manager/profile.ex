defmodule PhoenixSample.Manager.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profiles" do
    field :handle_name, :string
    field :social_media, :string
    field :views, :integer

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:social_media, :handle_name])
    |> validate_required([:social_media, :handle_name])
  end
end
