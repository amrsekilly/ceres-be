defmodule CeresWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :ceres

  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}, realm: :none)
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
