defmodule NavatrackWeb.AccessPermissions.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Accounts.AccessPermission, as: X

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
    conn = get(conn, ~p"/access_permissions/#{x.id}")
    response = html_response(conn, 200)
    assert response =~ "Id: #{x.id}"
    assert response =~ "Access Attribute Id: #{x.access_attribute_id}"
    assert response =~ "Access Operation Id: #{x.access_operation_id}"
  end

end
