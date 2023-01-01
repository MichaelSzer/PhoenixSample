defmodule PhoenixSample.ShoppingCart.CartProfile do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cart_profiles" do
    field :price_when_carted, :decimal
    field :quantity, :integer

    belongs_to :cart, PhoenixSample.ShoppingCart.Cart
    belongs_to :profile, PhoenixSample.Manager.Profile

    timestamps()
  end

  @doc false
  def changeset(cart_item, attrs) do
    cart_item
    |> cast(attrs, [:price_when_carted, :quantity])
    |> validate_required([:price_when_carted, :quantity])
    |> validate_number(:quanitity, greater_than_or_equal: 0, less_than: 100)
  end
end
