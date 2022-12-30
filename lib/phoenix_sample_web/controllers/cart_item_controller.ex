defmodule PhoenixSampleWeb.CartItemController do
  use PhoenixSampleWeb, :controller

  alias PhoenixSample.{ShoppingCart, Manager}

  def create(conn, %{"profile_id" => profile_id}) do
    profile = Manager.get_profile!(profile_id)

    case ShoppingCart.add_item_to_cart(conn.assigns.cart, profile) do
      {:ok, _item} ->
        conn
        |> put_flash(:info, "Item added to your cart")
        |> redirect(to: Routes.cart_path(conn, :show))

      {:error, _changeset} ->
        conn
        |> put_flash(:error, "There was an error adding the item to your cart")
        |> redirect(to: Routes.cart_path(conn, :show))
    end
  end

  def delete(conn, %{"id" => profile_id}) do
    {:ok, _cart} = ShoppingCart.remove_item_from_cart(conn.assigns.cart, profile_id)
    redirect(conn, to: Routes.cart_path(conn, :show))
  end
end
