defmodule NavatrackWeb.SkillsSmokeTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase

  test "GET /skills", %{conn: conn} do
    conn = get(conn, ~p"/skills")
    response = html_response(conn, 200)
    assert response =~ "Skills"
    assert response =~ "Id"
    assert response =~ "Sign"
    assert response =~ "Kind"
    assert response =~ "Name"
    assert response =~ "Status"
    assert response =~ "Tags"
  end

  test "GET /skills/new", %{conn: conn} do
    conn = get(conn, ~p"/skills/new")
    response = html_response(conn, 200)
    assert response =~ "Skills"
    assert response =~ "Sign"
    assert response =~ "Kind"
    assert response =~ "Name"
    assert response =~ "Status"
    assert response =~ "Tags"
    assert response =~ "Details"
    assert response =~ "Summary"
    assert response =~ "Description"
    assert response =~ "Images"
    assert response =~ "Avatar 400x400"
    assert response =~ "Splash 1080x1080 square"
    assert response =~ "Splash 1920x1080 landscape"
    assert response =~ "Splash 1920x1080 portrait"
  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/skills/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/skills"
      html when is_binary(html) ->
        assert html =~ "Skills"
      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end

end
