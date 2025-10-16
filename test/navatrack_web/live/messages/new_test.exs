defmodule NavatrackWeb.Messages.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.Message, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/messages/new")
    response = html_response(conn, 200)

    assert response =~ "Message"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"

    assert response =~ "From"
    assert response =~ "To"

  end

end
