defmodule NavatrackWeb.EventReviews.CreateTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.EventReview, as: X

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
    by_user = Navatrack.Accounts.User.fab!
    to_event = Navatrack.Works.Event.fab!
    {:ok, lv, _html} = live(conn, ~p"/event_reviews/new")

    result =
      lv
      |> form("#x_form", %{
        "form[by_user_id]" => by_user.id,
        "form[to_event_id]" => to_event.id,
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
