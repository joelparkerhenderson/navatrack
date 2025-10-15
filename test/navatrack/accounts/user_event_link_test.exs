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

  test "create" do
    user =
      Navatrack.Accounts.User
      |> Ash.Changeset.for_create(:create, %{
        name: "alfa bravo"
      })
      |> Ash.create!()

    event =
      Navatrack.Works.Event
      |> Ash.Changeset.for_create(:create, %{
        name: "alfa bravo"
      })
      |> Ash.create!()

    {:ok, _x} =
      X
      |> Ash.Changeset.for_create(:create, %{})
      |> Ash.Changeset.manage_relationship(:user, user, type: :append_and_remove)
      |> Ash.Changeset.manage_relationship(:event, event, type: :append_and_remove)
      |> Ash.create(authorize?: false)
  end
end
