defmodule NavatrackWeb.PageControllerTest do
  use NavatrackWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    response = html_response(conn, 200)
    assert response =~ "Navatrack"
  end
end
