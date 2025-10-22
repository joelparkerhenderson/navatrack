defmodule NavatrackWeb.MultiRaterFeedbackMessages.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.MultiRaterFeedbackMessage, as: X

  setup %{conn: conn} do
    {:ok, user} = my_user()
    {:ok, user} = my_sign_in(user)
    conn =
      conn
      |> Phoenix.ConnTest.init_test_session(%{})
      |> AshAuthentication.Plug.Helpers.store_in_session(user)

    {:ok, conn: conn}
  end

  test "show", %{conn: conn} do
    x = X.fab!
    conn = get(conn, ~p"/multi_rater_feedback_messages/#{x.id}")
    response = html_response(conn, 200)

    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.deleted_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Sign: #{x.sign}"
    assert response =~ "📍 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"
    assert response =~ "From: #{x.writer_as_user_id}"
    assert response =~ "To: #{x.reader_as_user_id}"
    assert response =~ "What is the person&#39;s key strength? #{x.strength}"
    assert response =~ "What should the person start doing in order to be effective? #{x.start}"
    assert response =~ "What should the person stop doing in order to be effective? #{x.stop}"
    assert response =~ "What should the person continue doing in order to be effective? #{x.continue}"
    assert response =~ "What should the person change doing in order to be effective? #{x.change}"
    assert response =~ "What more advice can help them? #{x.advice}"

  end

end
