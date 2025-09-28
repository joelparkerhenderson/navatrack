defmodule NavatrackWeb.UsersSmokeTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get(conn, ~p"/users")
    response = html_response(conn, 200)
    assert response =~ "Users"
    assert response =~ "Sign"
    assert response =~ "Kind"
    assert response =~ "Name"
    assert response =~ "Status"
    assert response =~ "Tags"
  end

  test "GET /users/new", %{conn: conn} do
    conn = get(conn, ~p"/users/new")
    response = html_response(conn, 200)
    assert response =~ "Users"
    assert response =~ "Sign"
    assert response =~ "Kind"
    assert response =~ "Name"
    assert response =~ "Status"
    assert response =~ "Tags"
    assert response =~ "Contacts"
    assert response =~ "URL"
    assert response =~ "Email"
    assert response =~ "Phone"
    assert response =~ "Messaging"
    assert response =~ "Postal"
    assert response =~ "ORCID PID"
    assert response =~ "RDF Type"
    assert response =~ "Socials"
    assert response =~ "LinkedIn URL"
    assert response =~ "GitHub URL"
    assert response =~ "Codeberg URL"
    assert response =~ "Locations"
    assert response =~ "Country code (ISO 3166-1 Alpha 2)"
    assert response =~ "Subcountry code (ISO 3166-2)"
    assert response =~ "Postal code"
    assert response =~ "Latitude"
    assert response =~ "Longitude"
    assert response =~ "AGENTS.md"
    assert response =~ "URL"
    assert response =~ "Text"
    assert response =~ "Images"
    assert response =~ "Avatar 400x400"
    assert response =~ "Splash 1080x1080 square"
    assert response =~ "Splash 1920x1080 landscape"
    assert response =~ "Splash 1920x1080 portrait"
    assert response =~ "Deeper Dive"
    assert response =~ "Note"
    assert response =~ "Email distribution list"
    assert response =~ "DaisyUI timeline HTML"
    assert response =~ "Org Mode"
    assert response =~ "Task list as markdown"
    assert response =~ "Ways Of Working"
    assert response =~ "Objectives and Key Results (OKRs)"
    assert response =~ "Key Performance Indicators (KPIs)"
    assert response =~ "Work Profile"
    assert response =~ "Résumé"
    assert response =~ "Curriculum Vitae"
    assert response =~ "Work Role"
    assert response =~ "Summary"
    assert response =~ "Role Name/Title/etc."
    assert response =~ "Role Level/Grade/etc."
    assert response =~ "Description"
    assert response =~ "Professional Development Plan"
    assert response =~ "Dates"
    assert response =~ "Start Date"
    assert response =~ "Stop Date"
    assert response =~ "Codes"
    assert response =~ "O*NET SOC 2019"
    assert response =~ "United Kingdom Civil Service Grade Abbreviation"
    assert response =~ "United Kingdom Standard Occupational Classification 2020 Code Service Grade Abbreviation"
    assert response =~ "United Kingdom Government Digital and Data Profession Capability Framework URL"
  end

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
