defmodule Ceres.Repo.Migrations.ChangeWalletStructure do
  use Ecto.Migration

  def change do
    alter table(:users) do
      remove(:wallet)
      add(:allowance, :float, default: 0.0)
      add(:personal_deposit, :float, default: 0.0)
    end
  end
end
