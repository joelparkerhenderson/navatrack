defmodule UserUkGdadPcfRoleLinkTest do
  alias Navatrack.Accounts.UserUkGdadPcfRoleLink, as: X
  use ExUnit.Case
  # import Ecto.Query

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  test "fab!" do
    X.fab!()
  end

end
