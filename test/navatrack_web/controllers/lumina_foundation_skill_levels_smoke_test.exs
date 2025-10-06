defmodule NavatrackWeb.LuminaFoundationSkillLevels do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  alias Navatrack.Codes.LuminaFoundationSkillLevels, as: X

  test "GET /lumina_foundation_skill_levels", %{conn: conn} do
    conn = get(conn, ~p"/lumina_foundation_skill_levels")
    response = html_response(conn, 200)
    assert response =~ "Lumina Foundation Skill Levels"
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
  end
end
