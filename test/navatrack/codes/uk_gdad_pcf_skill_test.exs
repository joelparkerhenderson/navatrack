defmodule UkGdadPcfSkillTest do
  alias Navatrack.Codes.UkGdadPcfSkill, as: X
  use ExUnit.Case
  # import Ecto.Query

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Navatrack.Repo)
    Ecto.Adapters.SQL.Sandbox.mode(Navatrack.Repo, {:shared, self()})
    :ok
  end

  test "one" do
    X.one()
  end

end
