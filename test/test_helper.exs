ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(AccessPass.Repo, :manual)

defmodule AccessPass.TestHelpers do
  def clear() do
    :mnesia.delete_table(:access_token_ets)
    :mnesia.delete_table(:refresh_token_ets)
    SyncM.add_table(:refresh_token_ets, [:uniq, :refresh, :access, :meta])
    SyncM.add_table(:access_token_ets, [:access, :refresh, :meta])
    Supervisor.terminate_child(AccessPass.Supervisor, AccessPass.TokenSupervisor)
    Supervisor.restart_child(AccessPass.Supervisor, AccessPass.TokenSupervisor)
    {:ok}
  end

  def isMap(map) when is_map(map), do: true
  def isMap(_), do: false
  def isErrorTup({:error, _}), do: true
  def isErrorTup(_), do: false
  def isOkTup({:ok, _}), do: true
  def isOkTup(_), do: false
end

defmodule AccessPass.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias AccessPass.Repo

      import Ecto
      import Ecto.Query
      import AccessPass.RepoCase
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(AccessPass.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(AccessPass.Repo, {:shared, self()})
    end

    :ok
  end
end
