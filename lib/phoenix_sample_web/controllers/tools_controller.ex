defmodule PhoenixSampleWeb.ToolsController do
  use PhoenixSampleWeb, :controller

  @invalide_code {:error, :invalid_code}

  action_fallback PhoenixSampleWeb.FallbackController

  plug :always_redirect

  def index(conn, _params) do
    case conn.params do
      %{"code" => code} ->
        if rem(String.to_integer(code), 2) == 1 do
          render(conn, "index.html")
        else
          @invalide_code
        end
      _ ->
        @invalide_code
    end
  end

  def show(conn, %{"name" => name}) do
    render(conn, "show.html", name: name)
  end

  defp always_redirect(conn, _) do
    if false and "Alejandro" not in conn.path_info do
      conn |> redirect(to: "/tools/Alejandro") |> halt()
    else
      conn
    end
  end
end
