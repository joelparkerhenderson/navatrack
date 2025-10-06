defmodule UserGroupLinkTest do
  alias Navatrack.Accounts.UserGroupLink, as: X
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
  #   user =
  #     Navatrack.Accounts.User
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   group =
  #     Navatrack.Works.Group
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   {:ok, x} =
  #     X
  #     |> Ash.Changeset.for_create(:create, %{
  #       user: user,
  #       group: group
  #     })
  #     |> Ash.create()
  # end
end
