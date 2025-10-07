defmodule UserInitiativeLinkTest do
  alias Navatrack.Accounts.UserInitiativeLink, as: X
  use ExUnit.Case
  # import ExUnitProperties
  # import Generator

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  test "create" do
    user =
      Navatrack.Accounts.User
      |> Ash.Changeset.for_create(:create, %{
        name: "alfa bravo"
      })
      |> Ash.create!()

    initiative =
      Navatrack.Works.Initiative
      |> Ash.Changeset.for_create(:create, %{
        name: "alfa bravo"
      })
      |> Ash.create!()

    {:ok, _x} =
      X
      |> Ash.Changeset.for_create(:create, %{})
      |> Ash.Changeset.manage_relationship(:user, user, type: :append_and_remove)
      |> Ash.Changeset.manage_relationship(:initiative, initiative, type: :append_and_remove)
      |> Ash.create(authorize?: false)
  end
end
