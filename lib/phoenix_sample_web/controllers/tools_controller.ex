defmodule PhoenixSampleWeb.ToolsController do
  use PhoenixSampleWeb, :controller

  plug :always_redirect

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"name" => name}) do
    render(conn, "show.html", name: name)
  end

  defp always_redirect(conn, _) do
    if "Alejandro" not in conn.path_info do
      conn |> redirect(to: "/tools/Alejandro") |> halt()
    else
      conn
    end
  end
end
