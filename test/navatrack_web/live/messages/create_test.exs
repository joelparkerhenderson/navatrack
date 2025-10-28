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
    from_user = Navatrack.Accounts.User.fab!
    to_user = Navatrack.Accounts.User.fab!
    {:ok, lv, _html} = live(conn, ~p"/messages/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa",
        "form[from_user_id]" => from_user.id,
        "form[to_user_id]" => to_user.id,
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
