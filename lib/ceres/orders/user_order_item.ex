defmodule Ceres.Orders.UserOrderItem do
  @moduledoc """
  Represents a food order in the system.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Ceres.Accounts.UserOrder

  schema "user_order_item" do
    belongs_to(:user_order_id, UserOrder)
    field(:name, :string)
    field(:quantity, :decimal, default: 0)
    field(:price, :decimal, default: 0)
    field(:main, :string)
    field(:fallback, :string)
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [
      :name,
      :quantity,
      :price,
      :main,
      :fallback
    ])
    |> validate_required([
      :name,
      :quantity,
      :price,
      :main,
      :fallback
    ])
    |> foreign_key_constraint(:user_order_id)
  end
end
