defmodule NavatrackWeb.AccessAssignments.CreateTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Accounts.AccessAssignment, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/access_assignments/new")
    x = X.fab!

    result =
      lv
      |> form("#x_form", %{
        "form[user_id]": x.user_id,
        "form[access_attribute_id]": x.access_attribute_id,
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/access_assignments"
      html when is_binary(html) ->
        assert html =~ "Id"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end
end
