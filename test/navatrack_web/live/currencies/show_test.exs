defmodule NavatrackWeb.Currencies.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Codes.Currency, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)

    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "show", %{conn: conn} do
    x = X.one()
    conn = get(conn, ~p"/currencies/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Id: #{x.id}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "Name: #{x.name}"
    assert response =~ "Number: #{x.number}"
    assert response =~ "Symbol: #{x.symbol}"
    assert response =~ "Position: #{x.position}"
  end

end
