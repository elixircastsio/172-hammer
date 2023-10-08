defmodule TeacherWeb.Plugs.AuthorizeKey do
  import Plug.Conn
  import Phoenix.Controller, only: [put_view: 2, render: 2]
  alias Teacher.Accounts

  def init(opts) do
    opts
  end

  def call(%Plug.Conn{params: %{"api_key" => api_key}} = conn, _opts) do
    if api_user = Accounts.get_user_by_api_key(api_key) do
      assign(conn, :api_user, api_user)
    else
      render_unauthorized(conn)
    end
  end
  def call(conn, _opts) do
    render_unauthorized(conn)
  end

  def render_unauthorized(conn) do
    conn
    |> put_status(401)
    |> put_view(json: TeacherWeb.ErrorJSON)
    |> render(:"401")
    |> halt()
  end

end
