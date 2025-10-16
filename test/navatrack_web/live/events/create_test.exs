defmodule NavatrackWeb.Events.CreateTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Works.Event, as: X

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
    {:ok, lv, _html} = live(conn, ~p"/events/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/events"
      html when is_binary(html) ->
        assert html =~ "Event"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end
end
