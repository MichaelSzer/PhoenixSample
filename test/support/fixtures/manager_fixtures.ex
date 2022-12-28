defmodule PhoenixSample.ManagerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PhoenixSample.Manager` context.
  """

  @doc """
  Generate a profile.
  """
  def profile_fixture(attrs \\ %{}) do
    {:ok, profile} =
      attrs
      |> Enum.into(%{
        handle_name: "some handle_name",
        social_media: "some social_media",
        tags: "some tags"
      })
      |> PhoenixSample.Manager.create_profile()

    profile
  end

  @doc """
  Generate a unique category title.
  """
  def unique_category_title, do: "some title#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        title: unique_category_title()
      })
      |> PhoenixSample.Manager.create_category()

    category
  end
end
