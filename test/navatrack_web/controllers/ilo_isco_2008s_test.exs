defmodule NavatrackWeb.IloIsco2008s do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase

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
    conn = get(conn, ~p"/ilo_isco_2008s")
    response = html_response(conn, 200)
    assert response =~ "ILO ISCO 2008s"
    assert response =~ "➡️ Id"
    assert response =~ "🪧 Code"
    assert response =~ "📛 Name"
  end
end
