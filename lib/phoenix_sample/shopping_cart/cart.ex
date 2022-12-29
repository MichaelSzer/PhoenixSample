defmodule PhoenixSample.ShoppingCart.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :user_email, :string

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:user_email])
    |> validate_required([:user_email])
    |> unique_constraint(:user_email)
  end
end
