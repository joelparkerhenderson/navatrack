defmodule NavatrackWeb.UserAimLinks.NewTest do
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

  # test "new", %{conn: conn} do
  #   conn = get(conn, ~p"/user_aim_links/new")
  #   response = html_response(conn, 200)
  #   assert response =~ "User Aim Link"
  # end

end
