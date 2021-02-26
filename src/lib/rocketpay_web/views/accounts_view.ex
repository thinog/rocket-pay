defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account

  def render("update.json", %{account: %Account{} = account}) do
    %{
      message: "Deposit done!",
      account: %{
        balance: account.balance,
        id: account.id
      }
    }
  end
end
