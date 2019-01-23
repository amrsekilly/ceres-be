defmodule CeresWeb.AuthView do
  use CeresWeb, :view
  import CeresWeb.JsonHelpers

  def render("user.json", %{code: code}) do
    # %{name: user.name, avatar: user.avatar, wallet: user.wallet, isAdmin: user.is_admin}
    # |> format_json_response
    %{code: code}
  end
end
