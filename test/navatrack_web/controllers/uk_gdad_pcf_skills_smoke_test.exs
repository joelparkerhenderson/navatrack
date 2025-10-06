defmodule NavatrackWeb.UkGdadPcfSkillsSmokeTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase

  test "GET /uk_gdad_pcf_skills", %{conn: conn} do
    conn = get(conn, ~p"/uk_gdad_pcf_skills")
    response = html_response(conn, 200)
    assert response =~ "UK GDAD PCF Skills"
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
  end

end
