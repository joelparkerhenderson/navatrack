defmodule NavatrackWeb.Currencies.IndexTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Codes.Currency, as: X

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
    conn = get(conn, ~p"/topics")
    response = html_response(conn, 200)
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
    assert response =~ "Code"
    assert response =~ "Number"
    assert response =~ "Symbol"
    assert response =~ "Position"
  end

end
