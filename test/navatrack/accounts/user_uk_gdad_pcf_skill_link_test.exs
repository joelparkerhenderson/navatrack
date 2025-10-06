defmodule UserUkGdadPcfSkillLinkTest do
  alias Navatrack.Accounts.UserUkGdadPcfSkillLink, as: X
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

  #   uk_gdad_pcf_skill =
  #     Navatrack.Codes.UkGdadPcfSkill
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   {:ok, x} =
  #     X
  #     |> Ash.Changeset.for_create(:create, %{
  #       user: user,
  #       uk_gdad_pcf_skill: uk_gdad_pcf_skill
  #     })
  #     |> Ash.create()
  # end
end
