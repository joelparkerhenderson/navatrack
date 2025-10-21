defmodule NavatrackWeb.AccessAssignments.IndexTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Accounts.AccessAssignment, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "index", %{conn: conn} do
    conn = get(conn, ~p"/access_assignments")
    response = html_response(conn, 200)
    assert response =~ "➡️ Id"
    assert response =~ "User Id"
    assert response =~ "Access Attribute Id"
  end

end
