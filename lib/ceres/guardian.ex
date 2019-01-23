defmodule Ceres.Guardian do
  use Guardian, otp_app: :my_app

  def subject_for_token(resource, _claims), do: {:ok, to_string(resource.id)}

  def resource_from_claims(claims) do
    # find_me_a_resource(claims["sub"]) # {:ok, resource} or {:error, reason}
  end
end
