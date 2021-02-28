defmodule Rockepay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.{Repo, User}
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Thiago",
        password: "123456",
        nickname: "thijooj",
        email: "thijooj@thijooj.como",
        age: 99
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{name: "Thiago", age: 99, id: ^user_id} = user
    end

    test "when there are invalid params, returns error" do
      params = %{
        name: "Thiago",
        nickname: "thijooj",
        email: "thijooj@thijooj.como",
        age: 10
      }

      {:error, changeset} = Create.call(params)

      expected_changeset = %{age: ["must be greater than or equal to 18"], password: ["can't be blank"]}

      assert errors_on(changeset) == expected_changeset
    end
  end
end
