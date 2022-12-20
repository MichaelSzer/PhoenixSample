defmodule PhoenixSampleWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, :invalid_code}) do
    conn
    |> put_status(403)
    |> put_view(PhoenixSampleWeb.ErrorView)
    |> render(:"403")
  end
end
