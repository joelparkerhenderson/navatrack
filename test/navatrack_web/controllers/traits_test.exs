defmodule NavatrackWeb.TraitsTest do
  import Phoenix.LiveViewTest
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
    conn = get(conn, ~p"/traits")
    response = html_response(conn, 200)
    assert response =~ "Traits"
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/traits/new")
    response = html_response(conn, 200)
    assert response =~ "Traits"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "Details"
    assert response =~ "Summary"
    assert response =~ "Description"
    assert response =~ "Images"
    assert response =~ "Avatar 400x400"
    assert response =~ "Splash 1080x1080 square"
    assert response =~ "Splash 1920x1080 landscape"
    assert response =~ "Splash 1920x1080 portrait"
  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/traits/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/traits"

      html when is_binary(html) ->
        assert html =~ "Traits"

      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end
end
