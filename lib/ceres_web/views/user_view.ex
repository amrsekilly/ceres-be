defmodule CeresWeb.UserView do
  use CeresWeb, :view

  def render("wallet.json", %{
        resource: %Ceres.Accounts.User{allowance: allowance, personal_deposit: personal_deposit}
      }) do
    %{
      wallet: allowance + personal_deposit,
      allowance: allowance,
      personalDeposit: personal_deposit
    }
  end

  def render("wallet.json", user) do
    %{error: "Failed to fetch the wallet"}
  end
end
