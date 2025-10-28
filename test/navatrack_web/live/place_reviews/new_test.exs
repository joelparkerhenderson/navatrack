defmodule NavatrackWeb.PlaceReviews.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.PlaceReview, as: X

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
    conn = get(conn, ~p"/place_reviews/new")
    response = html_response(conn, 200)

    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"
    assert response =~ "By User"
    assert response =~ "To Place"
    assert response =~ "What is the place&#39;s key strength?"
    assert response =~ "What should the place start doing in order to be effective?"
    assert response =~ "What should the place stop doing in order to be effective?"
    assert response =~ "What should the place continue doing in order to be effective?"
    assert response =~ "What should the place change doing in order to be effective?"
    assert response =~ "What more advice can help them?"
  end

end
