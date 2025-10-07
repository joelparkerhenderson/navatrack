defmodule NavatrackWeb.UserGroupLinksTest do
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

  # test "index", %{conn: conn} do
  #   conn = get(conn, ~p"/user_group_links")
  #   response = html_response(conn, 200)
  #   assert response =~ "User Group Links"
  # end

  # test "new", %{conn: conn} do
  #   conn = get(conn, ~p"/user_group_links/new")
  #   response = html_response(conn, 200)
  #   assert response =~ "User Group Link"
  # end

  # test "create", %{conn: conn} do
  #   {:ok, _lv, _html} = live(conn, ~p"/user_group_links/new")
  #   response = html_response(conn, 200)
  #   assert response =~ "User Group Link"

  #   result =
  #     lv
  #     |> form("#x_form", %{
  #       "form[name]" => "alfa"
  #     })
  #     |> render_submit()

  #   case result do
  #     {:error, {:live_redirect, %{to: path}}} ->
  #       assert path == "/user_group_links"

  #     html when is_binary(html) ->
  #       assert html =~ "User Group Links"

  #     other ->
  #       flunk("Unexpected result: #{inspect(other)}")
  #   end
  # end
end
