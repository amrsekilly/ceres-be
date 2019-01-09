defmodule Ceres.Orders.Transaction do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ceres.Order
  alias Ceres.User

  schema "order_transactions" do
    field(:amount, :decimal, default: 0)
    belongs_to(:order_id, Order)
    belongs_to(:teller_id, User)

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:amount, :order_id, :teller_id])
    |> validate_required([:amount, :order_id, :teller_id])
  end
end
