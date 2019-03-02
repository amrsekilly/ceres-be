defmodule CeresWeb.OrdersController do
  import Ecto.Query
  use CeresWeb, :controller
  alias Ceres.Repo
  alias Ceres.Orders.Order

  def create(conn, params = %{"data" => %{"name" => name}}) do
    {:ok, order} =
      Repo.insert(%Order{
        %Order{}
        | restaurant: name,
          url: params["data"]["url"],
          creator_id: conn.private.guardian_default_resource.id
      })

    # send_slack_message(
    #   "#{conn.private.guardian_default_resource.name} is ordering from #{name}, <!channe>! \n https://ceres.rubikal.com/orders/#{
    #     order.id
    #   }"
    # )

    send_slack_message(
      Poison.encode!(%{
        attachments: [
          %{
            text:
              "#{conn.private.guardian_default_resource.name} is ordering from #{name}, <!channe>! \n https://ceres.rubikal.com/orders/#{
                order.id
              }",
            fallback: "You are unable to decide",
            callback_id: "order_callback",
            color: "#3AA3E3",
            attachment_type: "default",
            actions: [
              %{
                name: "order",
                text: "Will order",
                type: "button",
                value: "will_order"
              },
              %{
                name: "order",
                text: "Not interesetd",
                type: "button",
                value: "not_interested"
              }
            ]
          }
        ]
      })
    )

    render(conn, "order.json", order: order)
  end

  defp send_slack_message(message) do
    HTTPoison.post(
      "https://hooks.slack.com/services/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",
      message,
      [{"Content-Type", "application/json"}]
    )
  end

  def index(conn, params) do
    orders =
      from(order in Order,
        where:
          order.status == "collecting" or
            order.status == "on_the_way" or
            order.status == "received"
      )
      |> order_by(desc: :updated_at)
      |> Repo.all()

    render(conn, "index.json", orders: orders)
  end

  def show(conn, %{"id" => id}) do
    order = Repo.get(Order, id)

    render(conn, "show.json", order: order)
  end

  def get_old_orders(conn, params) do
    orders =
      from(order in Order,
        where:
          order.status == "settled" or
            order.status == "cancelled"
      )
      |> order_by(desc: :updated_at)
      |> Repo.all()

    render(conn, "index.json", orders: orders)
  end
end
