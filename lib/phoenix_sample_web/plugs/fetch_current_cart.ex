defmodule PhoenixSampleWeb.Plugs.FetchCurrentCart do
  alias PhoenixSample.ShoppingCart
  import Plug.Conn

  def init(default), do: default

  @doc """
  Retrieve the cart from the database using the user session.
  """
  def call(conn, _default) do
    # Convert uuid to email since carts are managed by strings.
    user_email = "#{Integer.to_string(conn.assigns.user_uuid)}@gmail.com"

    if cart = ShoppingCart.get_cart_by_user_email(user_email) do
      assign(conn, :cart, cart)
    else
      {:ok, new_cart} = ShoppingCart.create_cart(user_email)
      assign(conn, :cart, new_cart)
    end
  end
end
