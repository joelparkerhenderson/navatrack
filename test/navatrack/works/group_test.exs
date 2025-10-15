defmodule GroupTest do
  alias Navatrack.Works.Group, as: X
  use ExUnit.Case
  # import ExUnitProperties
  # import Generator

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  test "create" do
    {:ok, _x} =
      X
      |> Ash.Changeset.for_create(:create, %{
        name: "alfa bravo"
      })
      |> Ash.create()
  end
end
