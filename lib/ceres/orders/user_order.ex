defmodule Ceres.Orders.UserOrder do
  @moduledoc """
  Represents a food order in the system.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Ceres.Accounts.{User, Order}

  @available_statuses ["pending", "accepted", "rejected"]

  schema "user_orders" do
    field(:status, :string, default: "pending")
    field(:comment, :string)
    field(:vat, :decimal, default: 0)

    belongs_to(:user_id, User)
    belongs_to(:order_id, Order)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [
      :status,
      :comment,
      :vat,
      :user_id,
      :order_id
    ])
    |> validate_required([
      :status,
      :comment,
      :vat,
      :user_id,
      :order_id
    ])
    |> validate_inclusion(:status, @available_statuses)
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:order_id)
  end
end
