defmodule NavatrackWeb.EventReviews.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.EventReview, as: X

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
    {:ok, lv, _html} = live(conn, ~p"/event_reviews/new")
    response = html_response(conn, 200)

    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"
    assert response =~ "By User"
    assert response =~ "To Event"
    assert response =~ "What is the event&#39;s key strength?"
    assert response =~ "What should the event start doing in order to be effective?"
    assert response =~ "What should the event stop doing in order to be effective?"
    assert response =~ "What should the event continue doing in order to be effective?"
    assert response =~ "What should the event change doing in order to be effective?"
    assert response =~ "What more advice can help them?"

    x = X.fab!

    result =
      lv
      |> form("#x_form", %{
        "form[by_user_id]" => x.by_user.id,
        "form[to_event_id]" => x.to_event.id,
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/event_reviews"
      html when is_binary(html) ->
        assert html =~ "📛"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
