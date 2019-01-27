defmodule CeresWeb.UserController do
  use CeresWeb, :controller
  alias Ceres.Accounts.User
  alias Ceres.Repo

  def get_wallet(conn, params) do
    IO.inspect("------------conn---------------")
    IO.inspect("---------------------------")
    IO.inspect("---------------------------")
    IO.inspect(conn)
    IO.inspect("------------params---------------")
    IO.inspect("---------------------------")
    IO.inspect("---------------------------")
    IO.inspect(params)
    conn
  end

  # defp insert_return_user(%{
  #        "user" => %{"id" => slack_id, "name" => name, "image_192" => image_192},
  #        "access_token" => access_token,
  #        "team" => %{"id" => "T02V520CG"}
  #      }) do
  #   user_params = %{
  #     slack_token: access_token,
  #     slack_id: slack_id,
  #     name: name,
  #     avatar: image_192
  #   }

  #   changeset = User.changeset(%User{}, user_params)

  #   case Repo.get_by(User, slack_id: slack_id) do
  #     nil -> Repo.insert(changeset)
  #     user -> {:ok, user}
  #   end
  # end

  # defp insert_return_user(_) do
  #   {:error, "Invalid Slack response"}
  # end

  # defp signin(changeset, conn) do
  #   case insert_return_user(changeset) do
  #     {:error, _} ->
  #       conn
  #       |> IO.inspect()

  #     {:ok, user} ->
  #       user
  #       |> append_jwt()
  #   end
  # end

  # defp append_jwt(user) do
  #   generated_jwt =
  #     user
  #     |> generate_jwt()

  #   user
  #   |> Map.put(:jwt, generated_jwt)
  # end

  # defp generate_jwt(%Ceres.Accounts.User{slack_id: slack_id}) do
  #   {:ok, token, _} = CeresWeb.Guardian.encode_and_sign(slack_id)
  #   token
  # end
end
