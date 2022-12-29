defmodule PhoenixSample.ShoppingCartFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixSample.ShoppingCart` context.
  """

  @doc """
  Generate a unique cart user_email.
  """
  def unique_cart_user_email, do: "some user_email#{System.unique_integer([:positive])}"

  @doc """
  Generate a cart.
  """
  def cart_fixture(attrs \\ %{}) do
    {:ok, cart} =
      attrs
      |> Enum.into(%{
        user_email: unique_cart_user_email()
      })
      |> PhoenixSample.ShoppingCart.create_cart()

    cart
  end
end
