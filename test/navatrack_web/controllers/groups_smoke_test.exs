defmodule NavatrackWeb.GroupsSmokeTest do
  import Phoenix.LiveViewTest
  use NavatrackWeb.ConnCase

  test "index", %{conn: conn} do
    conn = get(conn, ~p"/groups")
    response = html_response(conn, 200)
    assert response =~ "Groups"
    assert response =~ "➡️ Id"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"
  end

  test "new", %{conn: conn} do
    conn = get(conn, ~p"/groups/new")
    response = html_response(conn, 200)
    assert response =~ "Groups"
    assert response =~ "📛 Name"
    assert response =~ "🚦 Status"
    assert response =~ "🏷️ Tags"

    assert response =~ "Contacts"
    assert response =~ "🔗 URL"
    assert response =~ "📧 Email"
    assert response =~ "📱 Phone"
    assert response =~ "💬 Messaging"
    assert response =~ "📫 Postal"
    assert response =~ "🌺 ORCID PID"
    assert response =~ "🖇️ RDF Type"
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
    assert response =~ "GS1 codes"
    assert response =~ "GS1 Digital Link"
    assert response =~ "GS1 Country Code"
    assert response =~ "GS1 Global Location Number"
    assert response =~ "International Standard Industrial Classification V4"
    assert response =~ "Code"
    assert response =~ "Name"
    assert response =~ "Net Promoter Score"
    assert response =~ "Net Promoter Score (NPS) Customer Perspective"
    assert response =~ "Net Promoter Score (NPS) User Perspective"
    assert response =~ "Net Promoter Score (NPS) Worker Perspective"
    assert response =~ "Policies"
    assert response =~ "Ethics Policy"
    assert response =~ "Copyright Policy"
    assert response =~ "Corrections Policy"
    assert response =~ "Legal Policy"
    assert response =~ "Privacy Policy"
    assert response =~ "Security Policy"
    assert response =~ "Coordinated Disclosure Policy"
    assert response =~ "Open Source Policy"
    assert response =~ "Code of Conduct Policy"
    assert response =~ "Equal Opportunity Policy"
    assert response =~ "Social Network Policy"
    assert response =~ "Health &amp; Safety Policy"
    assert response =~ "Employee Handbook Policy"
    assert response =~ "Human Resources Policy"
  end

  test "create", %{conn: conn} do
    {:ok, lv, _html} = live(conn, ~p"/groups/new")

    result =
      lv
      |> form("#x_form", %{
        "form[name]" => "alfa"
      })
      |> render_submit()

    case result do
      {:error, {:live_redirect, %{to: path}}} ->
        assert path == "/groups"

      html when is_binary(html) ->
        assert html =~ "Groups"

      other ->
        flunk("Unexpected result: #{inspect(other)}")
    end
  end
end
