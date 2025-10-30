defmodule NavatrackWeb.UkGdadPcfRoleFamilies.IndexTest do
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
    conn = get(conn, ~p"/uk_gdad_pcf_role_families")
    response = html_response(conn, 200)
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
  end
end
