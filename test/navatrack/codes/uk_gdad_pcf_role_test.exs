defmodule UkGdadPcfRoleTest do
  alias Navatrack.Codes.UkGdadPcfRole, as: X
  use ExUnit.Case
  import Ecto.Query

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  test "random" do
    Navatrack.Repo.one(
      from l in X,
        order_by: fragment("RANDOM()"),
        limit: 1
    )
  end
end
