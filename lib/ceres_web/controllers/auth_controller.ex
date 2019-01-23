defmodule CeresWeb.AuthController do
  use CeresWeb, :controller
  use Guardian, otp_app: :my_app
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
        |> append_jwt()
    end
  end

  defp append_jwt(user) do
    generated_jwt =
      user
      |> generate_jwt()

    user
    |> Map.put(:jwt, generated_jwt)
  end

  defp generate_jwt(%Ceres.Accounts.User{slack_id: slack_id}) do
    to_string(slack_id)
  end

  # def resource_from_claims(claims) do
  #   # Here we'll look up our resource from the claims, the subject can be
  #   # found in the `"sub"` key. In `above subject_for_token/2` we returned
  #   # the resource id so here we'll rely on that to look it up.
  #   # id = claims["sub"]
  #   # resource = MyApp.get_resource_by_id(id)
  #   # {:ok,  resource}
  # end
  # def resource_from_claims(_claims) do
  #   {:error, "User is not authorized!"}
  # end
end
