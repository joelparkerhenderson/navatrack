defmodule NavatrackWeb.UserReviews.NewTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.UserReview, as: X

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
    conn = get(conn, ~p"/user_reviews/new")
    response = html_response(conn, 200)

    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
    assert response =~ "🗒️ Note"
    assert response =~ "From"
    assert response =~ "To"
    assert response =~ "What is the person&#39;s key strength?"
    assert response =~ "What should the person start doing in order to be effective?"
    assert response =~ "What should the person stop doing in order to be effective?"
    assert response =~ "What should the person continue doing in order to be effective?"
    assert response =~ "What should the person change doing in order to be effective?"
    assert response =~ "What more advice can help them?"
  end

end
