defmodule GateKeeperTest do
  use ExUnit.Case
  use AccessPass.RepoCase

  alias AccessPass.GateKeeper

  @valid_user_obj %{
    username: "example",
    password: "password123",
    password_confirm: "password123",
    email: "example@email.com"
  }

  setup do
    GateKeeper.register(@valid_user_obj)
  end

  test "can register user" do
    {result, token} = GateKeeper.register(%{
      username: "example2",
      password: "password123",
      password_confirm: "password123",
      email: "example2@email.com"
    })

    assert result == :ok
    assert token[:type] == "basic"
    assert token[:access_expire_in] == 5
  end

  test "cannot register invalid user" do
    {result, _token} = GateKeeper.register(%{
      username: "example2",
      password: "password123",
      password_confirm: "password123",
    })

    assert result == :error
  end

  test "cannot register user that already exists" do
    {result, _token} = GateKeeper.register(@valid_user_obj)
    assert result == :error
  end

  test "can login user" do
    {result, token} = GateKeeper.log_in("example", "password123")

    assert result == :ok
    assert token[:type] == "basic"
    assert token[:access_expire_in] == 5
  end

  test "cannot login non-existant user" do
    {result, _token} = GateKeeper.log_in("idonotexist", "fakepassword")
    assert result == :error
  end
end
