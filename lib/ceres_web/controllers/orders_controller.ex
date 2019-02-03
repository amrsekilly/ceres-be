defmodule CeresWeb.OrdersController do
  use CeresWeb, :controller
  alias Ceres.Repo
  alias Ceres.Orders.Order

  def create(conn, %{"data" => %{"name" => name, "url" => url}} = params) do
    {:ok, order} = Repo.insert(%Order{%Order{} | restaurant: name, url: url,
    creator_id: conn.private.guardian_default_resource.id })

    IO.inspect "order is"
    IO.inspect "order is"
    IO.inspect "order is"
    IO.inspect "order is"
    IO.inspect "order is"
    IO.inspect order
    render(conn, "order.json", resource: order)
  end
end
