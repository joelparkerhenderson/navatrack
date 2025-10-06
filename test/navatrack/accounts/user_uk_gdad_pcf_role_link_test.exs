defmodule UserUkGdadPcfRoleLinkTest do
  alias Navatrack.Accounts.UserUkGdadPcfRoleLink, as: X
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

  #   uk_gdad_pcf_role =
  #     Navatrack.Codes.UkGdadPcfRole
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   {:ok, x} =
  #     X
  #     |> Ash.Changeset.for_create(:create, %{
  #       user: user,
  #       uk_gdad_pcf_role: uk_gdad_pcf_role
  #     })
  #     |> Ash.create()
  # end
end
