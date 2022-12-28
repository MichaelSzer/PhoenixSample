defmodule PhoenixSampleWeb.ProfileController do
  use PhoenixSampleWeb, :controller

  alias PhoenixSample.Manager
  alias PhoenixSample.Manager.Profile

  def index(conn, _params) do
    profiles = Manager.list_profiles()
    render(conn, "index.html", profiles: profiles)
  end

  def new(conn, _params) do
    changeset = Manager.change_profile(%Profile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    case Manager.create_profile(profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile created successfully.")
        |> redirect(to: Routes.profile_path(conn, :show, profile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    profile =
      id
      |> Manager.get_profile!()
      |> Manager.inc_profile_views()

    render(conn, "show.html", profile: profile)
  end

  def edit(conn, %{"id" => id}) do
    profile = Manager.get_profile!(id)
    changeset = Manager.change_profile(profile)
    render(conn, "edit.html", profile: profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = Manager.get_profile!(id)

    case Manager.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: Routes.profile_path(conn, :show, profile))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", profile: profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = Manager.get_profile!(id)
    {:ok, _profile} = Manager.delete_profile(profile)

    conn
    |> put_flash(:info, "Profile deleted successfully.")
    |> redirect(to: Routes.profile_path(conn, :index))
  end
end
