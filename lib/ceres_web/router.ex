defmodule CeresWeb.Router do
  use CeresWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  get("/status", CeresWeb.HealthCheckController, :show)

  scope "/api", CeresWeb do
    pipe_through(:api)

    post("/login", AuthController, :login)
  end

  scope "/auth", CeresWeb do
    pipe_through(:api)

    get("/signout", AuthController, :signout)
    get("/slack", AuthController, :request)
    get("/slack/callback", AuthController, :callback)
  end
end
