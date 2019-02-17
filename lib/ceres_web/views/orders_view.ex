defmodule CeresWeb.OrdersView do
  use CeresWeb, :view
  alias Ceres.Orders.Order

  def render("index.json", %{orders: orders}) do
    %{data: render_many(orders, __MODULE__, "order.json", as: :order)}
  end

  def render("order.json", %{order: order}) do
    %{
      creatorId: order.creator_id,
      delivery: order.delivery,
      orderId: order.id,
      insertedAt: order.inserted_at,
      restaurant: order.restaurant,
      status: order.status,
      tips: order.tips,
      tipsOnDelivery: order.tips_on_delivery,
      updatedAt: order.updated_at,
      menuUrl: order.url
    }
  end

  def render("show.json", %{order: order}) do
    %{data: render_one(order, __MODULE__, "order.json", as: :order)}
  end
end
