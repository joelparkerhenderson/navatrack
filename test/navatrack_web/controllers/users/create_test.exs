defmodule NavatrackWeb.Users.CreateTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase
  use NavatrackWeb.AuthCase
  # alias Navatrack.Accounts.User, as: X

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/users/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/users"

      html when is_binary(html) ->
        assert html =~ "Users"

      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
