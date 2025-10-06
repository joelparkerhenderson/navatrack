defmodule NavatrackWeb.IloIsco2008s do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  alias Navatrack.Codes.IloIsco2008s, as: X

  test "GET /ilo_isco_2008s", %{conn: conn} do
    conn = get(conn, ~p"/ilo_isco_2008s")
    response = html_response(conn, 200)
    assert response =~ "ILO ISCO 2008s"
    assert response =~ "➡️ Id"
    assert response =~ "🪧 Code"
    assert response =~ "📛 Name"
  end

end
