defmodule Ceres.Repo.Migrations.UserOrderItem do
  use Ecto.Migration

  def change do
    create table(:user_order_item) do
      add(:user_order_id, references(:user_orders))
      add(:name, :string)
      add(:quantity, :decimal, default: 0)
      add(:price, :decimal, default: 0)
      add(:main, :string)
      add(:fallback, :string)
      timestamps()
    end

    create(index(:user_order_item, [:user_order_id]))
  end
end
