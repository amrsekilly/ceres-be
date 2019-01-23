defmodule CeresWeb.AuthView do
  use CeresWeb, :view

  def render("user.json", %{
        user: %Ceres.Accounts.User{
          name: name,
          avatar: avatar,
          wallet: wallet,
          is_admin: isAdmin,
          jwt: jwt
        }
      }) do
    %{name: name, avatar: avatar, wallet: wallet, isAdmin: isAdmin, jwt: jwt}
  end

  def render("user.json", _) do
    %{error: "Failed to login"}
  end
end
