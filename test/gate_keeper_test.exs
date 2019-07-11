defmodule GateKeeperTest do
  use ExUnit.Case
  use AccessPass.RepoCase

  alias AccessPass.GateKeeper

  test "can register user" do
    {result, token} = GateKeeper.register(%{
      username: "example",
      password: "otherexample",
      password_confirm: "otherexample",
      email: "example@email.com"
    })

    assert result == :ok
    assert token[:type] == "basic"
    assert token[:access_expire_in] == 5
  end
end
