defmodule UserIloIsco2008LinkTest do
  alias Navatrack.Accounts.UserIloIsco2008Link, as: X
  use ExUnit.Case
  import ExUnitProperties
  # import Generator

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  #TODO
  # test "create" do
  #   user =
  #     Navatrack.Accounts.User
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   ilo_isco_2008 =
  #     Navatrack.Codes.IloIsco2008
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   {:ok, x} =
  #     X
  #     |> Ash.Changeset.for_create(:create, %{
  #       user: user,
  #       ilo_isco_2008: ilo_isco_2008
  #     })
  #     |> Ash.create()
  # end
end
