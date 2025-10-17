defmodule NavatrackWeb.MultiRaterFeedbackMessages.IndexTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.MultiRaterFeedbackMessage, as: X

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
    conn = get(conn, ~p"/multi_rater_feedback_messages")
    response = html_response(conn, 200)

    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Sign"
    assert response =~ "📍 Status"
    assert response =~ "🏷️ Tags"
  end

end
