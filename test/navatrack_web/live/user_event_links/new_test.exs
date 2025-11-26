defmodule NavatrackWeb.UserEventLinks.NewTest do
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
  #   conn = get(conn, ~p"/user_event_links/new")
  #   response = html_response(conn, 200)
  #   assert response =~ "User Event Link"
  #
  #   x = X.fab!
  #
  #   result =
  #     lv
  #     |> form("#x_form", %{
  #       "form[name]" => x.name
  #     })
  #     |> render_submit()
  #
  #   case result do
  #     {:error, {:live_redirect, %{to: path}}} ->
  #       assert path == "/users"
  #
  #     html when is_binary(html) ->
  #       assert html =~ "User Event Links"
  #
  #     other ->
  #       flunk("Unexpected result: #{inspect(other)}")
  #   end
  # end

end
