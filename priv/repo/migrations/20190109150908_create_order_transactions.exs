defmodule Ceres.Repo.Migrations.CreateOrderTransactions do
  use Ecto.Migration

  def change do
    create table(:order_transactions) do
      add(:amount, :decimal, default: 0)
      add(:order_id, references(:orders))
      add(:teller_id, references(:users))

      timestamps()
    end

    create(index(:order_transactions, [:order_id]))
    create(index(:order_transactions, [:teller_id]))
  end
end
