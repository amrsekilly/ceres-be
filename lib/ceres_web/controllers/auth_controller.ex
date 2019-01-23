defmodule CeresWeb.AuthController do
  use CeresWeb, :controller
  alias Ceres.External.Slack
  alias Ceres.Accounts.User
  alias Ceres.Repo
  # plug(Ueberauth)

  @spec login(Plug.Conn.t(), map()) :: Plug.Conn.t()
  def login(conn, %{"code" => code}) do
    user =
      code
      |> Slack.getSlackOauth()
      |> Poison.decode!()
      |> signin(conn)

    # IO.inspect(user)

    render(conn, "user.json", user: user)
  end

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
        user
    end
  end
end
