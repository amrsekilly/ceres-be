defmodule CeresWeb.OrdersView do
  use CeresWeb, :view
  alias Ceres.Orders.Order

  def render("order.json", %{resource: %Order{
    creator_id: creatorId,
    delivery: delivery,
    id: orderId,
    inserted_at: insertedAt,
    restaurant: restaurant,
    status: status,
    tips: tips,
    tips_on_delivery: tipsOnDelivery,
    updated_at: updatedAt,
    url: menuUrl
  }}) do
    %{
      creatorId: creatorId,
      delivery: delivery,
      orderId: orderId,
      insertedAt: insertedAt,
      restaurant: restaurant,
      status: status,
      tips: tips,
      tipsOnDelivery: tipsOnDelivery,
      updatedAt: updatedAt,
      menuUrl: menuUrl
    }
  end

end
