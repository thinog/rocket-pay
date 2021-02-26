defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    params
    |> Rocketpay.create_user()
    |> handle_response(conn)
  end

  defp handle_response({:error, _result} = error , _conn), do: error
end
