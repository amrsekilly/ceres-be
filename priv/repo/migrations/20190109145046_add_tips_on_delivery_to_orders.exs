defmodule Ceres.Repo.Migrations.AddTipsOnDeliveryToOrders do
  use Ecto.Migration

  def change do
    alter table(:orders) do
      add(:tips_on_delivery, :float, default: 0)
    end
  end
end
