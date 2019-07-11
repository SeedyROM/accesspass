defmodule GateKeeperTest do
  use ExUnit.Case
  alias AccessPass.GateKeeper

  test "can register user" do
    {:ok, user} = GateKeeper.register(%{
      username: "example",
      password: "otherexample",
      password_confirm: "otherexample",
      email: "example@email.com"
    })

    IO.inspect(user)
  end
end
