defmodule CeresWeb.Guardian do
  use Guardian, otp_app: :ceres
  alias Ceres.Accounts.User
  alias Ceres.Repo

  @spec subject_for_token(any(), any()) :: {:ok, binary()}
  def subject_for_token(resource, _claims) do
    sub = to_string(resource)
    {:ok, sub}
  end

  @spec resource_from_claims(nil | keyword() | map()) :: {:ok, any()}
  def resource_from_claims(claims) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we returned
    # the resource id so here we'll rely on that to look it up.
    id = claims["sub"]
    resource = Repo.get_by(User, slack_id: id)
    {:ok, resource}
  end
end
