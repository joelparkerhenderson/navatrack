defmodule NavatrackWeb.UserUkGdadPcfRoleLinksTest do
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
  #   conn = get(conn, ~p"/user_uk_gdad_pcf_role_links")
  #   response = html_response(conn, 200)
  #   assert response =~ "User UK GDAD PCF Role Links"
  # end

  # test "new", %{conn: conn} do
  #   conn = get(conn, ~p"/user_uk_gdad_pcf_role_links/new")
  #   response = html_response(conn, 200)
  #   assert response =~ "User UK GDAD PCF Role Link"
  # end

  # test "create", %{conn: conn} do
  #   {:ok, _lv, _html} = live(conn, ~p"/user_uk_gdad_pcf_role_links/new")
  #   response = html_response(conn, 200)
  #   assert response =~ "User UK GDAD PCF Role Link"

  #   result =
  #     lv
  #     |> form("#x_form", %{
  #       "form[name]" => "alfa"
  #     })
  #     |> render_submit()

  #   case result do
  #     {:error, {:live_redirect, %{to: path}}} ->
  #       assert path == "/user_uk_gdad_pcf_role_links"

  #     html when is_binary(html) ->
  #       assert html =~ "User UK GDAD PCF Role Links"

  #     other ->
  #       flunk("Unexpected result: #{inspect(other)}")
  #   end
  # end
end
