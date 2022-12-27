defmodule PhoenixSampleWeb.PageController do
  use PhoenixSampleWeb, :controller
  alias PhoenixSample.{Repo, ClientRequest}

  def index(conn, _params) do
    render(conn, :index)
  end

  def received(%Plug.Conn{params: %{"user_name" => name, "user_email" => email, "user_description" => description, "user_location" => location  }} = conn, _params) do

    # Save in database
    case ClientRequest.changeset(%ClientRequest{}, %{name: name, email: email, location: location, description: description}) |> Repo.insert() do
      {:ok, _client_request} ->
        render(conn, :received)
      {:error, changeset} ->
        changeset
    end
  end

  def show_json(%Plug.Conn{params: url_params} = conn, _params) do
    json(conn, url_params)
  end

  def admin(conn, _params) do
    conn
    |> put_root_layout("admin.html")
    |> put_flash(:info, "My flash :info message.")
    |> put_flash(:error, "Fake error, everything is good.")
    |> render("index.html")
  end
end
