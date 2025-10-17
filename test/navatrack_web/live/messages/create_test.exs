defmodule NavatrackWeb.Messages.CreateTest do
  import Phoenix.LiveViewTest
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

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/messages/new")
    {:ok, user} = my_user()

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa",
        "form[writer_as_user_id]" => user.id,
        "form[reader_as_user_id]" => user.id,
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
