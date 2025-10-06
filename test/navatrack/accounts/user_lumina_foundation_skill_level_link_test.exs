defmodule UserLuminaFoundationSkillLevelLinkTest do
  alias Navatrack.Accounts.UserLuminaFoundationSkillLevelLink, as: X
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

  #   lumina_foundation_skill_level =
  #     Navatrack.Codes.LuminaFoundationSkillLevel
  #     |> Ash.Changeset.for_create(:create, %{
  #       name: "alfa bravo"
  #     })
  #     |> Ash.create!()

  #   {:ok, x} =
  #     X
  #     |> Ash.Changeset.for_create(:create, %{
  #       user: user,
  #       lumina_foundation_skill_level: lumina_foundation_skill_level
  #     })
  #     |> Ash.create()
  # end
end
