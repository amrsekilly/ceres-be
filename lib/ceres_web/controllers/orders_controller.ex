defmodule CeresWeb.OrdersController do
  use CeresWeb, :controller
  alias Ceres.Repo
  alias Ceres.Orders.Order
  import Ecto.Query

  def create(conn, %{"data" => %{"name" => name, "url" => url}}) do
    {:ok, order} = Repo.insert(%Order{%Order{} | restaurant: name, url: url,
    creator_id: conn.private.guardian_default_resource.id })

    render(conn, "order.json", order: order)
  end

  def index(conn, params) do
    query = from order in Order,
     where: order.status == "collecting" or order.status == "ordering"

    orders = Repo.all(query)

    render(conn, "index.json", orders: orders)
  end
end
