defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{Account, User}
  alias RocketpayWeb.UsersView

  test "renders create.json" do
    user_id = Ecto.UUID.generate()
    account_id = Ecto.UUID.generate()
    user = %User{id: user_id, account: %Account{id: account_id}}

    response = render(UsersView, "create.json", user: user)

    assert %{message: "User created", user: %{id: ^user_id, account: %{id: ^account_id}}} = response
  end
end
