defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{User, Account}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Thiago",
        password: "123456",
        nickname: "thijooj",
        email: "thijooj@thijooj.como",
        age: 99
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      [username: username, password: password] = Application.get_env(:rocketpay, :basic_auth)
      conn = put_req_header(conn, "authorization", "Basic #{Base.encode64("#{username}:#{password}")}")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make the deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:created)

      assert %{"account" => %{"balance" => "50.00", "id" => ^account_id}} = response
    end

    test "when there are invalid params, returns error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "atumalaca 😂🤣👌"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      assert %{"message" => "Invalid deposit value!"} = response
    end
  end
end
