defmodule NavatrackWeb.AccessAttributes.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Accounts.AccessAttribute, as: X

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
    x = X.fab!()
    conn = get(conn, ~p"/access_attributes/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.retired_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Sign: #{x.sign}"
    assert response =~ "📍 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"
  end

end
