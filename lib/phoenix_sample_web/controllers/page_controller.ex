defmodule PhoenixSampleWeb.PageController do
  use PhoenixSampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show_json(%Plug.Conn{params: url_params} = conn, _params) do
    json(conn, url_params)
  end

  def admin(conn, _params) do
    conn
    |> put_root_layout("admin.html")
    |> render("index.html")
  end
end
