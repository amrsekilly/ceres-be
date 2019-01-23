defmodule CeresWeb.AuthController do
  use CeresWeb, :controller
  alias Ceres.External.Slack
  alias Ceres.Accounts.User
  alias Ceres.Repo
  # plug(Ueberauth)

  @spec login(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def login(conn, %{"code" => code}) do
    code
    |> Slack.getSlackOauth()
    |> Poison.decode!()
    |> signin(conn)

    render(conn, "user.json", code: code)
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

  defp insert_update_user(%{
         "user" => %{"id" => slack_id, "name" => name, "image_192" => image_192},
         "access_token" => access_token
       }) do
    user_params = %{
      slack_token: access_token,
      slack_id: slack_id,
      name: name,
      avatar: image_192
    }

    changeset = User.changeset(%User{}, user_params)

    case Repo.get_by(User, slack_id: slack_id) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end

  defp insert_update_user(_) do
    {:error, "Invalid Slack response"}
  end

  defp signin(changeset, conn) do
    case insert_update_user(changeset) do
      {:error, _} ->
        conn
        |> IO.inspect()

      {:ok, user} ->
        conn
        |> IO.inspect()
    end
  end
end
