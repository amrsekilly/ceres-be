defmodule Ceres.Repo.Migrations.UsersOrders do
  use Ecto.Migration

  def change do
    create table(:user_orders) do
      add(:user_id, references(:users))
      add(:order_id, references(:orders))
      add(:status, :string, default: "pending")
      add(:comment, :text)
      add(:vat, :decimal, default: 0)
      timestamps()
    end

    create(index(:user_orders, [:user_id]))
    create(index(:user_orders, [:order_id]))
  end
end
