defmodule CeresWeb.AuthView do
  use CeresWeb, :view
  import CeresWeb.JsonHelpers

  def render("user.json", %{
        user: %Ceres.Accounts.User{name: name, avatar: avatar, wallet: wallet, is_admin: isAdmin}
      }) do
    # %{}
    # |> format_json_response
    %{name: name, avatar: avatar, wallet: wallet, isAdmin: isAdmin}
  end
end
