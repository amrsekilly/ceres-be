defmodule CeresWeb.OrdersController do
  use CeresWeb, :controller
  alias Ceres.Repo
  alias Ceres.Orders.Order
  import Ecto.Query

  def create(conn, %{"data" => %{"name" => name, "url" => url}}) do
    {:ok, order} =
      Repo.insert(%Order{
        %Order{}
        | restaurant: name,
          url: url,
          creator_id: conn.private.guardian_default_resource.id
      })

    render(conn, "order.json", order: order)
  end

  def index(conn, params) do
    query =
      from(order in Order,
        where:
          order.status == "collecting" or order.status == "ordering" or
            order.status == "on_the_way" or order.status == "recieved"
      )

    orders = Repo.all(query)

    render(conn, "index.json", orders: orders)
  end

  def show(conn, %{"id" => id}) do
    order = Repo.get(Order, id)

    render(conn, "show.json", order: order)
  end

  def get_old_orders(conn, params) do
    query =
      from(order in Order,
        where:
          order.status == "settled"
      )

    orders = Repo.all(query)

    render(conn, "index.json", orders: orders)
  end
end
