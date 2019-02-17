defmodule Ceres.Factory do
  use ExMachina.Ecto, repo: Ceres.Repo

  def user_factory do
    %Ceres.Accounts.User{
      name: Faker.Name.name(),
      slack_id: Faker.UUID.v4(),
      slack_token: Faker.String.base64(100),
      avatar: Faker.Internet.image_url()
    }
  end

  def order_factory do
    %Ceres.Orders.Order{
      creator: build(:user)
    }
  end
end
