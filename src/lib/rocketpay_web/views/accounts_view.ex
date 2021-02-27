defmodule RocketpayWeb.AccountsView do
  alias Rocketpay.Account
  alias Rocketpay.Accounts.Transactions.Response, as: TransactionResponse

  def render("update.json", %{account: %Account{} = account}) do
    %{
      message: "Balance changed successfully!",
      account: %{
        balance: account.balance,
        id: account.id
      }
    }
  end

  def render("transaction.json", %{transaction: %TransactionResponse{} = transaction}) do
    %{
      message: "Transaction done successfully!",
      transaction: %{
        from_account: %{
          id: transaction.from_account.id,
          balance: transaction.from_account.balance
        },
        to_account: %{
          id: transaction.to_account.id,
          balance: transaction.to_account.balance
        }
      }
    }
  end
end
