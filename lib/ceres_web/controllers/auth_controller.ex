defmodule CeresWeb.AuthController do
  use CeresWeb, :controller
  # alias Ceres.Accounts.User
  # alias Ceres.Repo
  # plug(Ueberauth)

  def login(conn, params) do
    IO.inspect "---------------------------------"
    IO.inspect "---------------------------------"
    IO.inspect "---------------------------------"
    IO.inspect conn
    IO.inspect "---------------------------------"
    IO.inspect "---------------------------------"
    IO.inspect "---------------------------------"
    IO.inspect params
  end

  # def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
  #   %{"image_192" => image_192} = auth.info.urls

  #   user_params = %{
  #     slack_token: auth.credentials.token,
  #     slack_id: auth.info.nickname,
  #     name: auth.info.name,
  #     avatar: image_192
  #   }
  #   IO.inspect "---------------------------------"
  #   IO.inspect "---------------------------------"
  #   IO.inspect "---------------------------------"
  #   User.changeset(%User{}, user_params)
  #   |> IO.inspect
  #   |> signin(conn)
  # end

  # def signout(conn, _) do
  #   conn
  #   |> IO.inspect()
  # end

  # defp signin(changeset, conn) do
  #   case insert_update_user(changeset) do
  #     {:error, _} ->
  #       conn
  #       |> IO.inspect()

  #     {:ok, user} ->
  #       conn
  #       |> IO.inspect()
  #   end
  # end

  # defp insert_update_user(%{changes: %{slack_id: slack_id}} = changeset) do
  #   case user = Repo.get_by(User, slack_id: slack_id) do
  #     nil -> Repo.insert(changeset)
  #     user -> {:ok, user}
  #   end
  # end
end
