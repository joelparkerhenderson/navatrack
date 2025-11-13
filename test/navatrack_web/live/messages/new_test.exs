defmodule NavatrackWeb.Messages.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.Message, as: X

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
    {:ok, lv, _html} = live(conn, ~p"/messages/new")
    response = html_response(conn, 200)

    assert response =~ "Message"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"
    assert response =~ "From"
    assert response =~ "To"

    x = X.fab!

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa",
        "form[from_user_id]" => x.from_user.id,
        "form[to_user_id]" => x.to_user.id,
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/messages"
      html when is_binary(html) ->
        assert html =~ "📛"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
