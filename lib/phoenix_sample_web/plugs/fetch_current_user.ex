defmodule PhoenixSampleWeb.Plugs.FetchCurrentUser do
  import Plug.Conn

  def init(default), do: default

  @doc """
  Retrieve the current user from session or create.
  Then assigns the current user to the current connection.
  """
  def call(conn, _default) do
    if user_uuid = get_session(conn, :current_uuid) do
      assign(conn, :user_uuid, user_uuid)
    else
      new_user_uuid = Ecto.UUID.generate()

      conn
      |> put_session(:user_uuid, new_user_uuid)
      |> assign(:user_uuid, new_user_uuid)
    end
  end
end
