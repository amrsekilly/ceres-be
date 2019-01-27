defmodule CeresWeb.UserController do
  use CeresWeb, :controller
  alias Ceres.Accounts.User
  alias Ceres.Repo

  @spec get_wallet(any(), any()) :: none()
  def get_wallet(conn, params) do
    user = conn.private.guardian_default_resource
    render(conn, "wallet.json", resource: user)
  end
end
