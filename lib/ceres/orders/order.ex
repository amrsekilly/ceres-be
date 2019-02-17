defmodule Ceres.Orders.Order do
  @moduledoc """
  Represents a food order in the system.
  """

  use Ecto.Schema

  import Ecto.Changeset

  alias Ceres.Accounts.User

  @available_statuses ["collecting", "ordering", "on_the_way", "received", "settled", "cancelled"]

  schema "orders" do
    field(:restaurant, :string)
    field(:url, :string)
    field(:status, :string, default: "collecting")
    field(:delivery, :float, default: 0.0)
    field(:tips, :float, default: 0.0)
    field(:tips_on_delivery, :float, default: 0.0)

    belongs_to(:creator, User)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [
      :restaurant,
      :url,
      :status,
      :delivery,
      :tips,
      :creator_id,
      :tips_on_delivery
    ])
    |> validate_required([
      :restaurant,
      :status,
      :delivery,
      :tips,
      :creator_id,
      :tips_on_delivery
    ])
    |> validate_inclusion(:status, @available_statuses)
    |> foreign_key_constraint(:creator_id)
  end
end
