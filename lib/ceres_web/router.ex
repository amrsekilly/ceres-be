defmodule CeresWeb.Router do
  use CeresWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :auth do
    plug(CeresWeb.AuthAccessPipeline)
  end

  get("/status", CeresWeb.HealthCheckController, :show)

  scope "/api/v1/login", CeresWeb do
    pipe_through(:api)

    post("/", AuthController, :login)
  end

  scope "/api/v1", CeresWeb do
    pipe_through(:api)
    pipe_through(:auth)

    get("/wallet", UserController, :get_wallet)
    resources("/orders", OrdersController, only: [:create, :show, :index])
    # resources("/orders/:orderId", OrdersControlelr, only: [:show])
  end
end
