defmodule CeresWeb.Router do
  use CeresWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :auth do
    plug(CeresWeb.AuthAccessPipeline)
  end

  get("/status", CeresWeb.HealthCheckController, :show)

  scope "/api/login", CeresWeb do
    pipe_through(:api)

    post("/", AuthController, :login)
  end

  scope "/api", CeresWeb do
    pipe_through(:api)
    pipe_through(:auth)
  end
end
