defmodule CeresWeb.OrderItemsController do
  import Ecto.Query
  use CeresWeb, :controller
  alias Ceres.Repo
  alias Ceres.Orders.UserOrderItem

  # def create(conn, params = %{"data" => %{"item" => item}}) do
  #   {:ok, orderItems} =
  #     Repo.insert(%UserOrderItem{
  #       %UserOrderItem{}
  #       | restaurant: name,
  #         url: params["data"]["url"],
  #         creator_id: conn.private.guardian_default_resource.id
  #     })

  #   render(conn, "order.json", order: order)
  # end

  # def index(conn, params) do
  #   orders =
  #     from(order in Order,
  #       where:
  #         order.status == "collecting" or
  #           order.status == "on_the_way" or
  #           order.status == "received"
  #     )
  #     |> order_by(desc: :updated_at)
  #     |> Repo.all()

  #   render(conn, "index.json", orders: orders)
  # end

  # def show(conn, %{"id" => id}) do
  #   order = Repo.get(Order, id)

  #   render(conn, "show.json", order: order)
  # end
end
