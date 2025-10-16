defmodule NavatrackWeb.Messages.ShowTest do
  # import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  alias Navatrack.Works.Message, as: X

  defp x! do
    {:ok, user} = my_user()
    X
      |> Ash.Changeset.for_create(:create, %{
        locale_code: "en-US",
        name: "my-name",
        sign: "○",
        status: "my-status",
        tagging: "my-tagging",
        note: "my-note",
        writer_as_user_id: user.id,
        reader_as_user_id: user.id,
      })
    |> Ash.create!()
  end

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
    x = x!()
    conn = get(conn, ~p"/messages/#{x.id}")
    response = html_response(conn, 200)

    # assert response =~ "Message"
    assert response =~ "Id: #{x.id}"
    # assert response =~ "Created at: #{x.created_at}"
    # assert response =~ "Updated at: #{x.updated_at}"
    # assert response =~ "Deleted at: #{x.deleted_at}"
    assert response =~ "Locale code: #{x.locale_code}"
    assert response =~ "📛 Name: #{x.name}"
    assert response =~ "🚦 Sign: #{x.sign}"
    assert response =~ "📍 Status: #{x.status}"
    assert response =~ "🏷️ Tags: #{x.tagging}"
    assert response =~ "🗒️ Note: #{x.note}"
  end

end
