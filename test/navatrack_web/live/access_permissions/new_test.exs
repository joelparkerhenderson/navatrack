defmodule NavatrackWeb.AccessPermissions.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Accounts.AccessPermission, as: X

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
    conn = get(conn, ~p"/access_permissions/new")
    response = html_response(conn, 200)

    assert response =~ "Access Attribute Id"
    assert response =~ "Access Operation Id"

  end

  test "new…", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/access_permissions/new")
    x = X.fab!
    result =
      lv
      |> form("#x_form", %{
        "form[access_attribute_id]": x.access_attribute_id,
        "form[access_operation_id]": x.access_operation_id,
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/access_permissions"
      html when is_binary(html) ->
        assert html =~ "Id"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
