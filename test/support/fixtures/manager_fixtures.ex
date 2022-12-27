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
end
