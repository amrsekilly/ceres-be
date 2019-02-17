defmodule Ceres.Repo.Migrations.ChangeWalletValue do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify(:wallet, :float, default: 0.0)
    end
  end
end
