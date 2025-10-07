defmodule UserIloIsco2008LinkTest do
  alias Navatrack.Accounts.UserIloIsco2008Link, as: X
  use ExUnit.Case
  import Ecto.Query

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

    ilo_isco_2008 =
      Navatrack.Repo.one(
        from l in Navatrack.Codes.IloIsco2008,
          order_by: fragment("RANDOM()"),
          limit: 1
      )

    {:ok, _x} =
      X
      |> Ash.Changeset.for_create(:create, %{})
      |> Ash.Changeset.manage_relationship(
        :user,
        user,
        type: :append_and_remove
      )
      |> Ash.Changeset.manage_relationship(
        :ilo_isco_2008,
        ilo_isco_2008,
        type: :append_and_remove
      )
      |> Ash.create(authorize?: false)
  end
end
