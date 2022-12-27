defmodule PhoenixSample.ClientRequest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "client_requests" do
    field :description, :string
    field :email, :string
    field :location, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(client_request, attrs) do
    client_request
    |> cast(attrs, [:name, :email, :location, :description])
    |> validate_required([:name, :email, :location, :description])
  end
end
