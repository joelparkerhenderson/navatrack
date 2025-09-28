defmodule NavatrackWeb.UkGdadPcfRolesSmokeTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase

  test "GET /uk_gdad_pcf_roles", %{conn: conn} do
    conn = get(conn, ~p"/uk_gdad_pcf_roles")
    response = html_response(conn, 200)
    assert response =~ "Name"
  end

end
