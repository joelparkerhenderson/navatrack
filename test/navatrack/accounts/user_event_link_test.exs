defmodule UserEventLinkTest do
  alias Navatrack.Accounts.UserEventLink, as: X
  use ExUnit.Case
  # import ExUnitProperties
  # import Generator

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  test "fab!" do
    X.fab!()
  end

end
