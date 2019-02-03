defmodule CeresWeb.OrdersController do
  use CeresWeb, :controller
  alias Ceres.Repo
  alias Ceres.Orders.Order

  def create(conn, %{"data" => %{"name" => name, "url" => url}}) do
    Repo.insert(%Order{%Order{} | restaurant: name, url: url})
    # render(conn, "wallet.json", resource: user)
  end
end
