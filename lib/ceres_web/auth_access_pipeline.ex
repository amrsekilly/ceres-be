defmodule CeresWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :ceres

  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.EnsureAuthenticated)
  plug(Guardian.Plug.LoadResource)
end
