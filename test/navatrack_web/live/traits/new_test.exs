defmodule NavatrackWeb.Traits.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.Trait, as: X

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
    conn = get(conn, ~p"/traits/new")
    response = html_response(conn, 200)

    assert response =~ "Trait"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"

    assert response =~ "Summary"
    assert response =~ "Description"
    assert response =~ "Images"
    assert response =~ "Avatar image 400x400"
    assert response =~ "Main image 1080x1080 square"
    assert response =~ "Main image 1920x1080 landscape"
    assert response =~ "Main image 1080x1920 portrait"

  end

  test "new…", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/traits/new")
    x = X.fab!
    result =
      lv
      |> form("#x_form", %{
        "form[name]" => x.name
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/traits"
      html when is_binary(html) ->
        assert html =~ "📛"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
