defmodule UkGdadPcfRoleTest do
  alias Navatrack.Codes.UkGdadPcfRole, as: X
  use ExUnit.Case
  import ExUnitProperties
  # import Generator

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  # TODO
  # test "create" do
  #   {:ok, x} =
  #     X
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create()
  # end
end
